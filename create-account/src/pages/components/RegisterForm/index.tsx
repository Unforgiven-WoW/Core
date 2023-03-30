import { Box, Button, Grid, TextField } from "@mui/material";
import './styles.module.css'
import validate from 'validate.js'
import { useEffect, useRef, useState } from "react";

const constraints = {
    username: {
        length: {
            minimum: 3,
            maximum: 32,
            message: 'The requested account name is to short. Please try again.',
        },
    },
    password: {
        length: {
            minimum: 6,
            maximum: 32,
            message: 'The requested account name is to short. Please try again.',
        }
    },
    email: {
        email: {
            message: 'The requested email is not valid. Please try again.',
        }
    }
}

export default function RegisterForm() {
    const usernameRef = useRef()
    const passwordRef = useRef()
    const confirmPasswordRef = useRef()
    const emailRef = useRef()

    const validateForm = ({ target }: any) => {
        const id = target.id
        const value = target.value

        const formData = {
            // @ts-ignore
            username: usernameRef.current?.value,
            // @ts-ignore
            password: passwordRef.current?.value,
            // @ts-ignore
            email: emailRef.current?.value
        }

        const errors = validate(formData, constraints)
        for (const field in errors) {
            // @ts-ignore
            usernameRef.current.setAttribute('error', true)
            console.log("DSDS")
        }

        // @ts-ignore
        usernameRef.current.setAttribute('error', true)
    }

    return (
        <Grid alignItems='center' style={{
            backgroundColor: 'white',
            padding: '25px'
        }}>
            <h2 style={{ color: 'black' }}>Create Account</h2>
            <Grid item>
                <TextField
                    id='username'
                    label='Username'
                    inputRef={usernameRef}
                    onChange={validateForm}
                />
            </Grid>
            <Grid item>
                <TextField
                    id='password'
                    label='Password'
                    type='password'
                    inputRef={passwordRef}
                    onChange={validateForm}
                />
            </Grid>
            <Grid item>
                <TextField
                    id='confirmPassword'
                    label='Confirm password'
                    inputRef={confirmPasswordRef}
                    onChange={validateForm}
                />
            </Grid>
            <Grid item>
                <TextField
                    id='email'
                    label='Email'
                    inputRef={emailRef}
                    onChange={validateForm}
                />
            </Grid>
            <Grid item>
                <Button
                    className='registerButton'
                    variant='contained'
                    id='registerButton'>
                    Register
                </Button>
            </Grid>
        </Grid>
    )
}
