Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F213ACA65
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785220567; cv=pass; b=quNslG6qzkW7Dkz/xAcmDTT4oejTtsE2y3f1i49FEyfd3mF13edpbXV8b9bMomoWF0NXgaZNih/5byS60HEXzWWa7a62pfM+KYOEIcad+lBoZcbA/P7XAqaWY3yyZ3vtNWnGHJWTf4HQK1yvan56C3kcwQkDKpM1/zUbBFnLH4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785220567; c=relaxed/simple;
	bh=uKxcPvvi9THW59oy8ygK8tFBpk8FtDiIG2d01vDjCVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzUzd/xA3hesz+nUvD+Epobw4mAJl5LTnLe4RQm68ABFaDWsoQ8xrdm/bDNs1YmTzL5mlVJsf/BDX2BsDP8noOBEohGUWfERDNMOn0xsF75hGWVQSPiuRWFDj95tgmHAB3cWRU8JjpWKPHvVbqUU11bKjPfVZEhswuGHDGQ8z28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HAa9Vfun; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HAa9Vfun"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1f758014b8so15388566b.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 23:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785220564; cv=none;
        d=google.com; s=arc-20260327;
        b=KtsXP2Zh1d6ScN4qLhLBM1KyIq3+M0Hsdz3qCbNy0TZmAXGIF/ukTYorW5xetqTIwe
         d0cQREXOapcD68XgJW0lKPG194piMd6+NethMLiZyHWAVomWUbrqGaJDApI4Znz9y3sQ
         I3bWFycRfvEVnVDU6P/nYFihE/HpWYSbbq3DDmAHlw4ztiRd/LTTjkNcYkmwpqCoKl29
         Y5OlSlfZ6zjY5cbx07s0WSS+XEncTcfoc3/Y8tlNjjUGBorBkgSCNEnu1BqJKNyFFeCE
         GrdIpmdrW3FaEAGWg5JhkF0DogHqtoI1qbhT8P3OSU/e2y35gocku4n1cfzPuJ6MGUUY
         KD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=duzfZmLmmvJhemX2jMFCmPO9f3XrbkW2eTjJNcX7UWE=;
        fh=DS5bbPiOLVtdnvK5myu3ZpN1rww8ua7xYdcqejp0gOk=;
        b=H7vfdiSzpuslYYlfXfqqnlPpahAjtBAmhc4/Ewn7BZZtYJrEBms+sPMZw7gX9FUCz2
         GhMXWX/soDisCs+d5AprAR7uN1hY0I1eytgxXfyfRXVBlWEGYmBiz1sHasKMErjmHn2k
         9ix2LD8/7uAthlrePCoiWaws7J9VjXc8NATd8NQzfcG106HAevkJ/GH+rzpyqQI30UFN
         X9jXSZcsPt4/Mx37P2pUT1Q7vqKI9+4QWV82x+Ab73vf3skZmmsU4d8T0AITw0LFD9Fu
         zfLYGIFZhsltFJrtvhxk8Citi0wxvKYNU5GH3FPVh00eyXv+4eWoGd2wiiaajls1mJ8V
         6gDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785220564; x=1785825364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=duzfZmLmmvJhemX2jMFCmPO9f3XrbkW2eTjJNcX7UWE=;
        b=HAa9VfunyfzIp0v1vTKNufbBGo3uIL/zoJzECyD1g5EZx7aJowIO+IfPQMu/cFtayZ
         BV3RBjaOBcrhfRWk9U27jsHc1VUPCSVfjgWE3Du/B+Z8kMxurDTDgzQ+lEkMclT6pzfx
         4BETg2XcLFfwTeifm7stHwoR8QnuhILBiIDoxonmmYJbLnyjMp7CLIRlOfuGIp3KGnIs
         wYXNCT77IfwC6ELK3Iov4kXqZKjVaQ0YVTBvOQb9UzTv+3M5wchWcGQvswlydQdXSu2I
         R+n91BdsSd0JtysDD6m0j1AbgdPNWpSjLY5vxfeYW9p5IIk8Zb57rqx5ulB8CvCSy4ag
         HI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785220564; x=1785825364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duzfZmLmmvJhemX2jMFCmPO9f3XrbkW2eTjJNcX7UWE=;
        b=f+tiSefJOYtExctJvwDV/AxqG2HkPlesy4er/eTYlTi0vmFWB0FF7P6mzdZ/G2u3Td
         F2YjrCYdjLptbrq2+8pxDky5vHGw/hwREgXAD347LtAnV1lrLL1jaqRODJWiJ5o0zskO
         6PoiBrcODsnJLPm3HscyuvEQHa1sJurtMqN/d/S/HMvh305P7RLxk3+H/RLtXJ9vlxqG
         vwnbQZ2GU9VvY8TOCpMPxTDV3KjO5DE1JKPjLP8IAmYMI4VFwR1qjW5qkjw1KcSsFXfU
         gt4N2GecVC/232SQ5ePf1B4wXMm+Uq515TXPLDuJb3zzc9/klBMncJNLRzhC+ovfJRbJ
         kyLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvEof3cHWeF8TmZS84lNGf/FXS2V0iwr8CRbubVgSPxv+eCdLGaITlDSGao/AzXoZcM+Qi37MIi9ANVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl8ryjifxiOu/qkTLdvJCnuAF3G2e+G1nn+DY82W5LfKVPTYhX
	hrzl6tmcdODBhc+WBnxkvE1/hdp9+GwQtpZhbL5GkRJNE19OLngzHV3WmUbboEUcBi2GcPCmosl
	bhBOag2vkgM0pVAehXG8GjeP/MExR+aOOlFhh0cfELg==
X-Gm-Gg: AR+sD10gF59grPMB9/UlGKOuQUyfYEVJM8z0ZZbKy/n1YBTazf6gT/ol0XUM0f8bpRO
	MtMQ9vpbO3AuTtUtrKOSQrE9mcE2Q1+hy68i0ouLIhQrg/UlNSMddTuke5rnAUq91sUkFGEHfCh
	eXc59XMyhm1QsLbEPYA9gwKV8DYbm360spsiyfPIfZP0U/pKvyiplqarbGAG/q/kFWq+era+joL
	7LHqi5Nfio/BKJ0WefSuc2fSaPnM7grCrOf06IzgpW90Sk+Fyg2BaUFMa4WPi3FewIijDffOtXC
	71OAalfNI9acv5BKq+YYaKMIznbB
X-Received: by 2002:a17:907:d10:b0:c15:d422:3bde with SMTP id
 a640c23a62f3a-c1f72143dccmr45688966b.32.1785220564048; Mon, 27 Jul 2026
 23:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
 <20260714114654.3885457-1-shoubaineng@gmail.com> <20260714114654.3885457-2-shoubaineng@gmail.com>
 <20260714141359.7758575d@pumpkin> <CAGCp47zPkd6MWcMpxobphJp6giufpnJL46iFQMt9p76gb7OtKA@mail.gmail.com>
 <20260714153319.07b2b1e1@pumpkin> <CAGCp47wsjwstEebFcKSv+Hox0LJo=oYgt5n-2xfKWgq4WLZK1Q@mail.gmail.com>
 <CAGCp47zxaZsoBKeXz2YdyxbX8QOy_g8dGwnC9gVpJ-Sqng48Qg@mail.gmail.com>
In-Reply-To: <CAGCp47zxaZsoBKeXz2YdyxbX8QOy_g8dGwnC9gVpJ-Sqng48Qg@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 28 Jul 2026 12:05:52 +0530
X-Gm-Features: AUfX_mwmHSb9ULjRcWMzRfxF5YDIQvTQbS3OokFwfCg21Sudlmr7BMxr4LzKAj0
Message-ID: <CAO_48GGxJj6AU6vsu-Y18WKtL_9RT=zsXWp3L+ifZdLM7CgGtw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dma-buf: dma-heap: don't publish fd before
 copy_to_user() succeeds
To: =?UTF-8?B?5a+/5p+P6IO9?= <shoubaineng@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Sandeep Patil <sspatil@android.com>, "Andrew F . Davis" <afd@ti.com>, Srinivas Kandagatla <srini@kernel.org>, 
	stable@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Baineng,

On Mon, 27 Jul 2026 at 08:56, =E5=AF=BF=E6=9F=8F=E8=83=BD <shoubaineng@gmai=
l.com> wrote:
>
> Ping. Any chance this can be picked up?

Thank you for the patch.

While discussing with T J, we realised that adding a selftest for this
would also be helpful. Could you please re-submit with a selftest
added?
>
> Baineng

Thanks and best regards,
Sumit.

>
> =E5=AF=BF=E6=9F=8F=E8=83=BD <shoubaineng@gmail.com> =E4=BA=8E2026=E5=B9=
=B47=E6=9C=8815=E6=97=A5=E5=91=A8=E4=B8=89 10:04=E5=86=99=E9=81=93=EF=BC=9A
>>
>> Hi David
>>
>> The rollback here is the simplest possible case (put_unused_fd +
>> dma_buf_put), not the complex sockopt scenario you describe.
>>
>> Baineng
>>
>> David Laight <david.laight.linux@gmail.com> =E4=BA=8E2026=E5=B9=B47=E6=
=9C=8814=E6=97=A5=E5=91=A8=E4=BA=8C 22:33=E5=86=99=E9=81=93=EF=BC=9A
>>>
>>> On Tue, 14 Jul 2026 21:38:07 +0800
>>> =E5=AF=BF=E6=9F=8F=E8=83=BD <shoubaineng@gmail.com> wrote:
>>>
>>> > Hi David,
>>> >
>>> > Thanks for the feedback.
>>> >
>>> > The concern is not just about the EFAULT return =E2=80=94 it's about =
the race
>>> > window between fd_install() and copy_to_user().  Once fd_install()
>>> > returns, the fd is immediately observable by other threads in the sam=
e
>>> > process (via /proc/self/fd, SCM_RIGHTS, etc.), even before
>>> > copy_to_user() has a chance to fail.  The triggering condition is a
>>> > deliberate mprotect() flip, not a corrupted heap.
>>>
>>> That is what makes doing the close wrong.
>>> But that is a program aggressively trying to hit the timing window,
>>> not a normal program that has managed to pass an invalid pointer.
>>> The most likely reason for a real program passing an invalid pointer
>>> is a corrupted heap (assuming the stupid coding errors are fixed).
>>>
>>> It is really no different from the sockopt code that receives
>>> SCM_RIGHTS messages.
>>> In that case once you've removed the FILE from the socket (or similar)
>>> you really don't want to have to put it back because the write to the
>>> sockopt buffer or length field fails.
>>> The chance of correctly reverting the kernel state is small - and won't
>>> be tested.
>>>
>>>         David
>>>
>>> >
>>> > The fix itself is small and follows the standard kernel idiom:
>>> > get_unused_fd_flags() reserves the fd without publishing it, so the
>>> > window between reservation and install is entirely under kernel contr=
ol.
>>> >
>>> > Baineng
>>> >
>>> > David Laight <david.laight.linux@gmail.com> =E4=BA=8E2026=E5=B9=B47=
=E6=9C=8814=E6=97=A5=E5=91=A8=E4=BA=8C 21:14=E5=86=99=E9=81=93=EF=BC=9A
>>> >
>>> > > On Tue, 14 Jul 2026 19:46:53 +0800
>>> > > Baineng Shou <shoubaineng@gmail.com> wrote:
>>> > >
>>> > > > DMA_HEAP_IOCTL_ALLOC allocates a dma-buf and installs an fd into =
the
>>> > > > caller's fd table via dma_buf_fd() -> fd_install() before
>>> > > > dma_heap_ioctl() copies the result back to userspace.  If the tra=
iling
>>> > > > copy_to_user() fails, userspace never learns the fd number, but t=
he
>>> > > > fd (and the underlying dma-buf reference) are already visible to
>>> > > > other threads in the same process and are leaked for the lifetime=
 of
>>> > > > the process.
>>> > > >
>>> > > > The obvious "close it on the failure path" fix is unsafe: once
>>> > > > fd_install() has run, another thread can already dup() the fd, se=
nd
>>> > > > it via SCM_RIGHTS, or close() it and let its number be reused, so=
 a
>>> > > > subsequent close_fd() from the ioctl path can operate on an unrel=
ated
>>> > > > file.  This was pointed out by Christian K=C3=B6nig on v1 [1].
>>> > > ...
>>> > >
>>> > > My 2c:
>>> > >
>>> > > The other option is just to leave it as a 'problem for user space'.
>>> > > No reasonable program is going to handle the EFAULT return by doing
>>> > > anything other than exiting.
>>> > > Even getting an EFAULT is really an indication that the application
>>> > > is already in a real mess - most likely with a badly corrupted heap=
.
>>> > >
>>> > > Anything else leaves error recovery code in the kernel that is pret=
ty
>>> > > much never executed and open to a variety of bugs.
>>> > > While the recovery here is probably ok, there are some sockopt call=
s
>>> > > where it is all more complicated.
>>> > >
>>> > >         David
>>> > >
>>>
