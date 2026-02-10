<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs"
    Inherits="Home" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="fade-in">
            <section class="hero">
                <h1 style="margin-bottom: 0.5rem;">
                    Smart Parking, <span
                        style="background: linear-gradient(to right, var(--secondary-color), var(--primary-color)); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Simplified</span>
                </h1>
                <p>Experience the future of parking management. Secure your spot in seconds with our premium booking
                    system.</p>

                <% if (Session["username"]==null) { %>
                    <div style="display: flex; gap: 1rem; justify-content: center;">
                        <a href="Login.aspx" class="btn btn-primary">Get Started</a>
                        <a href="Register.aspx" class="btn"
                            style="background: rgba(255,255,255,0.1); color: white;">create account</a>
                    </div>
                    <% } else { %>
                        <a href="SearchParking.aspx" class="btn btn-primary">Find a Spot Now</a>
                        <% } %>
            </section>

            <section class="features">
                <div class="card text-center">
                    <div class="feature-icon"></div>
                    <h3>Easy Search</h3>
                    <p>Find available parking spots near you instantly with real-time availability checking.</p>
                </div>
                <div class="card text-center">
                    <div class="feature-icon"></div>
                    <h3>Secure Payment</h3>
                    <p>Hassle-free, secure digital payments. Book your spot and pay in advance.</p>
                </div>
                <div class="card text-center">
                    <div class="feature-icon"></div>
                    <h3>Safe & Secure</h3>
                    <p>24/7 monitored parking locations ensuring your vehicle is always safe.</p>
                </div>
            </section>
        </div>
    </asp:Content>