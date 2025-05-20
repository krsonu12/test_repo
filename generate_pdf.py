from fpdf import FPDF

def generate_loan_amortization_pdf():
    # Create a PDF document
    pdf = FPDF()
    pdf.add_page()
    
    # Set font
    pdf.set_font("Arial", "B", 12)
    
    # Title
    pdf.cell(0, 10, "Loan Amortization Schedule", 0, 1, "C")
    pdf.ln(5)
    
    # Table header
    header = ["Month", "Principal (Rs.)", "Interest (Rs.)", "EMI (Rs.)", "Outstanding Principal (Rs.)"]
    
    # Table data
    data = [
        ["1", "4166.67", "1000.00", "5166.67", "100000.00"],
        ["2", "4166.67", "958.33", "5125.00", "95833.33"],
        ["3", "4166.67", "916.67", "5083.33", "91666.67"],
        ["4", "4166.67", "875.00", "5041.67", "87500.00"],
        ["5", "4166.67", "833.33", "5000.00", "83333.33"],
        ["6", "4166.67", "791.67", "4958.33", "79166.67"],
        ["7", "4166.67", "750.00", "4916.67", "75000.00"],
        ["8", "4166.67", "708.33", "4875.00", "70833.33"],
        ["9", "4166.67", "666.67", "4833.33", "66666.67"],
        ["10", "4166.67", "625.00", "4791.67", "62500.00"],
        ["11", "4166.67", "583.33", "4750.00", "58333.33"],
        ["12", "4166.67", "541.67", "4708.33", "54166.67"],
        ["13", "4166.67", "500.00", "4666.67", "50000.00"],
        ["14", "4166.67", "458.33", "4625.00", "45833.33"],
        ["15", "4166.67", "416.67", "4583.33", "41666.67"],
        ["16", "4166.67", "375.00", "4541.67", "37500.00"],
        ["17", "4166.67", "333.33", "4500.00", "33333.33"],
        ["18", "4166.67", "291.67", "4458.33", "29166.67"],
        ["19", "4166.67", "250.00", "4416.67", "25000.00"],
        ["20", "4166.67", "208.33", "4375.00", "20833.33"],
        ["21", "4166.67", "166.67", "4333.33", "16666.67"],
        ["22", "4166.67", "125.00", "4291.67", "12500.00"],
        ["23", "4166.67", "83.33", "4250.00", "8333.33"],
        ["24", "4166.67", "41.67", "4208.33", "4166.67"]
    ]
    
    # Column widths
    col_widths = [20, 35, 35, 35, 55]
    
    # Header
    pdf.set_fill_color(200, 200, 200)
    for i in range(len(header)):
        pdf.cell(col_widths[i], 10, header[i], 1, 0, "C", True)
    pdf.ln()
    
    # Data rows
    pdf.set_font("Arial", "", 10)
    for row in data:
        for i in range(len(row)):
            pdf.cell(col_widths[i], 8, row[i], 1, 0, "C")
        pdf.ln()
    
    # Calculate summary information
    total_principal = 100000.00  # Initial loan amount
    total_interest = sum(float(row[2]) for row in data)
    total_payment = total_principal + total_interest
    
    # Add summary section
    pdf.ln(10)
    pdf.set_font("Arial", "B", 11)
    pdf.cell(0, 10, "Loan Summary", 0, 1, "L")
    
    pdf.set_font("Arial", "", 10)
    pdf.cell(60, 8, "Loan Amount:", 0, 0)
    pdf.cell(0, 8, f"Rs. {total_principal:.2f}", 0, 1)
    
    pdf.cell(60, 8, "Total Interest Paid:", 0, 0)
    pdf.cell(0, 8, f"Rs. {total_interest:.2f}", 0, 1)
    
    pdf.cell(60, 8, "Total Amount Paid:", 0, 0)
    pdf.cell(0, 8, f"Rs. {total_payment:.2f}", 0, 1)
    
    pdf.cell(60, 8, "Loan Term:", 0, 0)
    pdf.cell(0, 8, "24 months (2 years)", 0, 1)
    
    pdf.cell(60, 8, "Interest Rate:", 0, 0)
    pdf.cell(0, 8, "12% per annum", 0, 1)
    
    # Save the PDF
    pdf.output("loan_amortization.pdf")
    
    print("PDF generated successfully: loan_amortization.pdf")

if __name__ == "__main__":
    generate_loan_amortization_pdf() 