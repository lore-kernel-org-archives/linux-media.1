Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6B25A645
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426017; cv=none; b=Yv7qSHroqkeGrJyfD0FBF46tnGMWUwrObxAeq4AUxjKp8JE8t+g1fDZe2jBr0PdXVBzkDleX7r8dPo29pAETG+mm3brp11KDCb0t27x83qKSV/Nm+LYBhluVTK4ppWG9V2kt+dZdIFnaDtddy8hWBe2rF+V5RgQ4xscZyfFGTbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426017; c=relaxed/simple;
	bh=wsgCzSiXdk/+t4Rrgioy4E6NaWX4RpZlqKj9ZRGWctI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGfOSIVX0Gl9q+rLqPxOahyLqCh4tS1vsHxHBJsdSBeE+07zt7hfl90xeMk5UdzgshdaP5B6QquyrZIXIluXtynRIGKlngAvC4OzYejskcxvO5lXyEJmgZRWZQN5jwDoHLtZuILXNofxSuqXsvuHrS7v5Cfn9Bssmth9wLuG+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uqg9D/hM; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uqg9D/hM"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2554293a91.2
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 02:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788426015; x=1789030815; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnJlMpKIpQH6zlGOAWXNzpFk5ps3z1vbu6W8sefA4qM=;
        b=Uqg9D/hMQqIKDGyjMCvR6ZnScci0eoWKKxXbth5Al6YTTgBrN81C7xn6dT0mGnJp0y
         gvKeEYi6bHJeVOBeK/B+O5l/s9fVbBejEbA4OlA3/FZgGXJs66i1VfwWJqP7O/jKpMEE
         xXD7anlRy0zZUfVOEvQTPuYKJ9Qn0ciGNvmSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426015; x=1789030815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SnJlMpKIpQH6zlGOAWXNzpFk5ps3z1vbu6W8sefA4qM=;
        b=gUeqKES9CvL0oToQ80ndj2XSnyn2sxpq4xyCH5OH9Dy8SESqHyPhpgOj1krsTe88xU
         OB8v14ecI0XFdUtMTE3J66ZSOSm6s4U7jX1jdgaltKNUwGZszvxvONIa69o4vozmKXiV
         4CGjJUIfrpJp+fA91j/7mdh3voke9l86CB2zA7+Jj5kU8fOu4y/OdUiqBYAXaERCECsD
         btobR2wKbc16BPFLGGvYntKqVtndGf/h5UoXN5kU/nXBwUBWl4aVPwUi7LDczUrL9wTY
         99a5oG2YIaO+r7j9Msx7Qfk1gd2gGN4E6TkwxcLljk4TegC9LEr3QZ9V7y56081JrBYh
         E70A==
X-Forwarded-Encrypted: i=1; AKwUvBxft/Cb2CPegHrmk4jZ2OW6K9GfPqEd33UG4nulsOYpkXNUZvAz8A96QdbJMLvsgLDLz8xwID8Xp5q6vQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mmFIP4dwjYPCk30YqM8a5LEoVkU1CuFQncR2NJOhO9e0fsOVvK
	K8TTxCbUn4NhVqVgnxQ4rBqfMFy5X1/p+X15FU1LQkkYst5P0XBTPkMexerJ0h05TkZmoRmzLgI
	Q/o8=
X-Gm-Gg: AYBFou0ROUVnkPhyrynHbZig2opaqqDPN1Hfj8hME0aKPs4djutfrG+VF9RnJiBiY9z
	iWy6pMd67gnI6alNg4bY0GWE7NQvR4JfRvC4hvCmhr+giupiKmDxcvDLD42xElHYsqGajWl4ONO
	6Nf55oW1ALObbY2w2BOG2V7zXbWaiMssV/Bb0fdDJhsTppEQywn2sMCB25W0cuVwMdp9B5psKm8
	2pfeFXpTt4F3Nh67bPu09902QoXWL9uragIQ3F3aN79NTQxI1ThxBVkXklCFrsjIwtoxo40ydKr
	5EY06QrGaqaIBWJMepiyMhGal/jbI14RFBxDn4MfnpcsitxOfEqvTbQlM62K/LI50Z/UhL1rN58
	qnH6KaHeG9nqOW3zNzLEgifVt1oC+o7CwS8B496Q/XhHtmg2d9HRrtojo3DBwTBvSeiRaBF1pnT
	ShPKdZnQz/xNJ3VPWKOGEnT1unOaDGXOC2mWMJPMUgMZzUcg4MBkZNsyr2qae2szVP3V69DIdqb
	ey380JkSPAK/MhHs4ma6epInA==
X-Received: by 2002:a17:90b:5828:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39aee0e64d8mr16433292a91.15.1788426014114;
        Thu, 03 Sep 2026 02:00:14 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm4060057a91.8.2026.09.03.02.00.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:00:14 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so1848608a91.3
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 02:00:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwEDj1JUxvTXST6r0Wmi92IMATeyAUBubtPbjqJNjJ8eklHQ4U8Rl+/tPcrubAimcT9H2uNC2GgJUtcvQ==@vger.kernel.org
X-Received: by 2002:a17:90b:53d0:b0:37d:f983:7b5 with SMTP id
 98e67ed59e1d1-39aedf779b3mr16502132a91.9.1788426012187; Thu, 03 Sep 2026
 02:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903081145.8382-1-rh_king@163.com>
In-Reply-To: <20260903081145.8382-1-rh_king@163.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 3 Sep 2026 10:59:59 +0200
X-Gmail-Original-Message-ID: <CANiDSCse5+Ke-Z2321F_QHJZX2suCKxnBy5WuNHE3m1wjoxX-Q@mail.gmail.com>
X-Gm-Features: AcwNN1Xc-o8TlHLDY42LydtHhOD_RZgsehCqg15CxrkoOhqu9BeyzvXOGw7ipWo
Message-ID: <CANiDSCse5+Ke-Z2321F_QHJZX2suCKxnBy5WuNHE3m1wjoxX-Q@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add quirk for Luxvisions RGB Camera (30c9:0122)
To: Kean Ren <rh_king@163.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kean

Could you provide the whole output of lsusb -v 30c9:0122

Thanks!

On Thu, 3 Sept 2026 at 10:58, Kean Ren <rh_king@163.com> wrote:
>
> The device binds cleanly but delivers no image data; USB autosuspend is
> suspending the streaming endpoint. Disable autosuspend for it.
>
> Issue found on Lenovo ThinkPad X13 (codename Zelda, Intel); confirmed
> working with this quirk.
>
> Tested-by: Kean Ren <rh_king@163.com>
> Signed-off-by: Kean Ren <rh_king@163.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc71ba98..32bf353013a1 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3216,6 +3216,15 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Luxvisions Innotech Integrated RGB Camera (Lenovo laptops) */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x30c9,
> +         .idProduct            = 0x0122,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
>         /* Intel Realsense D435i depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.40.0
>
>


-- 
Ricardo Ribalda
