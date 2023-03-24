import Head from 'next/head';
import Link from 'next/link';
import Image from 'next/image';
import Header from '@jcomponents/header';
import Nav from '@jcomponents/nav';

export const pageHeight='100vh';
export const pageHeightWithHeader='calc(100vh - '+'100px'/*header height*/+')'; // fills the entire page

export default function Page({children, noheader=false, title, padding, ...props}: {
    children: any;
    title?: string;
    padding?: boolean;
    noheader?: boolean;
    [key: string]: any;
}) {
    return <>
        {/* Metadata */}
        <Head>
            <title>{title}</title>
            <meta charSet="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <meta httpEquiv="X-UA-Compatible" content="IE=edge" />
        </Head>

        {/* Header */}
        {!noheader &&
            <Header>
                <div> {/* Left */}
                    <Link href='/'>
                        <Image src='/images/logo.png' alt='logo' width={70} height={70} />
                    </Link>
                </div>
                <div> {/* Right */}
                    <Nav>
                        <Nav.Item href='/'>Home</Nav.Item>
                        <Nav.Item href='/login'>Login</Nav.Item>
                        <Nav.Item href='/sign-up'>Sign Up</Nav.Item>
                    </Nav>
                </div>
            </Header>
        }

        {/* Main Content */}
        <main style={{
            position: 'relative',
            padding: 0, margin: 0, width: '100%', 
            // minHeight: 'calc(100vh - 77px - 89px)',
            height: noheader ? pageHeight : pageHeightWithHeader // fills the entire page
        }} {...{props}}>
            {padding
            ? <div className='j_container j_max-w'>{children}</div> //if center, wrap in centering container
            : children}
        </main>
    </>;
}
