Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ACC3C3438
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362733; cv=none; b=FSoBQB+mr6pZZ5Ch1mdL3GyTLJmPpYuvFcR98/w4VdvMvcAmNY8EgIHrvAZ//hU5Z2gB6BUCwpk+q0G5gtj5V3IFhs75VM+4ft5rJKJhJrjlkMOryttSPunyhs6eNLHcVI9ywT2icWNib1cdyI1INE6VUrZbckbR8GZPWPsm0tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362733; c=relaxed/simple;
	bh=cUCOvrwZNYJ93TzzjPduqckoiYdf5scoI91GjA688Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYRUOsVbkujPwVCdtUdRJVPbZj0SZ/A67nZcSy1iASq0wH1Fpd28vtfTT3Sn/N21XW/sOq/oCytWTDoxS53QgcgbwToie67c9eN35XAOX64gAtznRbltZ4PzBY0NiUAGSwLB8Z5u/5z5MIljV18UsQHd+w4NHcrRXH8vrUrCVpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lQKdbGDh; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lQKdbGDh"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a1f7f42510so1545148a12.0
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 04:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786362730; x=1786967530; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vt26899TwVMjSklpB6JL+ciaOvdGQnhVp8YZLTm+78U=;
        b=lQKdbGDhSaz7Hzo/nDsBHEtKm4uzA0oQcscmTgDOAjBHagtJXO8A25qucg8eQ576i/
         IWc/A4TDA/9/6amswNLW9QpdRlWJxn8gu0qrsHebZjERdCRmwsaUXIKC+dJmDfN3s5ij
         OJngleOXiJvzDHOwqmvgtJ2jxf0RnadcCKA7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362730; x=1786967530;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vt26899TwVMjSklpB6JL+ciaOvdGQnhVp8YZLTm+78U=;
        b=js3vVkcmR9bdGJmm/hLsq6snc93L+n4AxTxioyOobXDbpLwQF8l46YUwGzRizb3yvR
         Pbr3cWKme6rLwEaHT1jOtx6PwknTqfQVIkGrRLde/L1uuOUUAGjaOacC1pDTHBMSOlOY
         KR+TviYuLBYxt0XEJPw5Mp1oDmXfqtBl9XJmOLa12dsr3fQsI1tQ4UpQBtqWujDdizVX
         NlyGsXnRYXoWSHP/5ML4zZ+MmSPIn9GabK4fUOVC6IhpaX9v6CsjY4lVjtibifxKIaDa
         ly5XRZPe016qMa+hhsHEhY3WLOsE9YNMQPVhNAnAsh2x/O7iYjrTbA+FyX+rUQxlZhLJ
         7ofA==
X-Forwarded-Encrypted: i=1; AHgh+RoQBGgf6ja2qgV7Xhz23KVFcg9EGxCNgC5JqZcQB5LOQM3z0IBFn2T1/5GO11qt0ikmDpNLlRigv//Elg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5iCDksiwVE3eIaqxs0H7j3ePic5GOo9yUA/elJVGU1RxgY+nb
	OczpmeGmJ4YBXUfPJaOK1rhZrEiKOZqhgVfkVfmeKLCQx4E6DfCvtdT3qaBuPzzboWQQQ+5beu9
	LwtmaBQ==
X-Gm-Gg: AR+sD13S30K89Nwb+LC026NE65bRriv8MCR7pxySlXHtqekZIMlgArUu1PaLFVhXz78
	NegZ4U9WgaKIHPoszppGqA9ZFuxiOiJe71p9TFPSXr2CnitonDpdlE2p3nre644UXcpHiaR8B3/
	OYXAy8BiR6c7j7PahgG3R8fmWtV6jnGy3LVreatfO6gm9+hvV+HNvt9YuyPRXazMlloLnvxfyW2
	WHJXth6nOoT5bviJ7PUVdMfJnnPTFx1oJzh5BCxh05IBlhlD0UrXak9RrlomeX087yFA4Ov0Dfn
	8oc2bQ7cWrObMdj0A6XnfA1FRQhhX+A7RqJqTUNiLzFr52/ip5j+9gvFXldVJioIbi3fW75/ZEO
	o7wFaSdftpvLaYuQLCoQySl4fiQc7in9S5gIvtptua50lfrYqxF5vMSVMFGp/kcjI9krlps4+P1
	9mQUaGovY9Jz6qN0yVRsvb8GCqqhSs9pVDZHF+KJm46V6lFzBkuzp3vZa46o9sIHpDAjga13SMT
	epyHCgpzOETDoRYovxUmcZcNQ==
X-Received: by 2002:a05:6402:a0d3:b0:6a1:f26d:ba78 with SMTP id 4fb4d7f45d1cf-6a1f26dbd36mr9064184a12.11.1786362729844;
        Mon, 10 Aug 2026 04:52:09 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1e7d5b31dsm3885319a12.24.2026.08.10.04.52.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 04:52:08 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso1966156a12.3
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 04:52:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq/ISMbq1kCN0kmkPyD74ccnvpqPGLUnedp3dLayYSpUk0sZJvU1wFF0boEHsjM4Gv2mQBwj6ptIrl4MA==@vger.kernel.org
X-Received: by 2002:a17:907:1b04:b0:c15:d4f8:dade with SMTP id
 a640c23a62f3a-c2039b394abmr1947856466b.2.1786362726960; Mon, 10 Aug 2026
 04:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ABE1FC11603F6BBE+20260810091624.2159038-1-raoxu@uniontech.com>
In-Reply-To: <ABE1FC11603F6BBE+20260810091624.2159038-1-raoxu@uniontech.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 10 Aug 2026 13:51:54 +0200
X-Gmail-Original-Message-ID: <CANiDSCvUBV-r7a7d7AbU7aXJ_kJYg80_y_7+8Rk+Wt7FkwaJAQ@mail.gmail.com>
X-Gm-Features: AUfX_mwC-JQgjX08GvfbcVU9ul_-OLbokBaXSXTZzsWHxoVjvht1T8b4uZt44Dw
Message-ID: <CANiDSCvUBV-r7a7d7AbU7aXJ_kJYg80_y_7+8Rk+Wt7FkwaJAQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix output terminal type check for ID namespace
To: raoxu <raoxu@uniontech.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Xu

Good catch :)

On Mon, 10 Aug 2026 at 11:21, raoxu <raoxu@uniontech.com> wrote:
>
> From: Xu Rao <raoxu@uniontech.com>
>
> Commit 3d9f32e02c2e ("media: uvcvideo: Create an ID namespace for
> streaming output terminals") added a separate internal ID namespace for
> streaming output terminals.  The namespace is only valid for those
> terminals because their descriptor IDs are used by streaming interface
> bTerminalLink fields, and uvc_stream_for_terminal() intentionally masks
> the internal namespace bit when matching that link.
>
> The parser currently decides whether to use the namespace with
> `type & UVC_TT_STREAMING`.  Terminal types are values, not bitmasks.
> Since UVC_TT_STREAMING is 0x0101, standard non-streaming output terminal
> types such as UVC_OTT_VENDOR_SPECIFIC, UVC_OTT_DISPLAY and
> UVC_OTT_MEDIA_TRANSPORT_OUTPUT also make the test true through their
> 0x0100 bits.
>
> Those terminals can then receive an internal ID that differs from their
> descriptor ID even though normal UVC descriptor references still use the
> 8-bit descriptor ID.  This can make later entity lookups fail or hide an
> entity ID collision that should be handled as a regular UVC descriptor
> collision.
>
> Use an equality check so that only UVC_TT_STREAMING output terminals
> enter the separate namespace.  The issue was easy to miss because real
> streaming output terminals make both the bitwise and equality tests true,
> so the devices targeted by the original change keep working.
>
> Fixes: 3d9f32e02c2e ("media: uvcvideo: Create an ID namespace for streaming output terminals")
> Cc: stable@vger.kernel.org
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc71ba98..acfc5797a1c2 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1130,7 +1130,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>                  * so limit usage of this separate namespace to streaming output
>                  * terminals.
>                  */
> -               if (type & UVC_TT_STREAMING)
> +               if (type == UVC_TT_STREAMING)
>                         id |= UVC_TERM_OUTPUT;
>
>                 term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> --
> 2.50.1
>
>


-- 
Ricardo Ribalda
