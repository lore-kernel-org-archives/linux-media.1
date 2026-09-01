Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB14A36D4E1
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245126; cv=none; b=UahBBOP7JF4dBoj0Kdh3ZPHviXTJCRmpooZOnqnEWJKPO3Yc7+Dk9qtZ4q6n7bRRXIYFI/+iK9fIBlSl/xv2c8rlBfn0FKXH9zLcA1ezxgMQZSHpIRScR2uTY2mX1iN/qVGFSS3itww+nn41rXvgYKpBOYY84VZV4nFbz8kVOBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245126; c=relaxed/simple;
	bh=SOXj6z+iLm4Scr8A6iCdnZDM0HQTlGMxjKffj9beV+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKkipqZU/8CwVEsW0txqOC7x275toZCoDPiWlG1e55Icv6INH/dZKy51ARo33Eae8tp/uR+GqlA2xkSkiEzTfgUO8bu/8wl5FVLGIgVbJxzCt2It2JqqijaLslwzmm72vIES/r8Batg2qMV6+xX2vhH9mWk85bBuinIP+/ZH018=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SMoS2Kvr; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SMoS2Kvr"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso465011a91.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 23:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788245117; x=1788849917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lundeczBtASlc12UyGqiUGYiHU680GtxqSj/n9yuvhk=;
        b=SMoS2KvrLZo5zOE6xnVWlYCb7Af7mY8dabDPrNOKJIMUk/Fiyl/7jiA/8IXw+JUgZ5
         +ZglVhxEiAZoYJlVcYOgGWFi4teKEK39iaRLokPdBFgWJbnB8mDUKFCJN4Soe3/3i1W8
         zq+KYWnP0U9QklvCMjT12KgdaAalZ97qwnQj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245117; x=1788849917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lundeczBtASlc12UyGqiUGYiHU680GtxqSj/n9yuvhk=;
        b=gEjKaU+4nO9LvMm5LS3v6CVrnFw1/HmPrD6vzMLcMjz5/L/bH0P51a34wKQPy7kahp
         PldwNepMnFR0TRm/r5/Nqr4PLPF08AulmXnMh99o337BcQqomEvbJF3k+fMj8a/qr0iW
         dm1elUoc+4Fvo20f7Kf+HX3z0ofPXaExHaSwY9v6x0aAoMNlwJ7acP756c1hzuFWrzds
         CJZckPlSIyJkV8VI/hC3pHAEvbrabiXoK5kWeb/fZniD6aX6fRDmAqY2RIYUMBAfhIy9
         3W/Xsg/R+32Xch8n8/M2wf7fSck4qiQhRfTw9YTEid22+VUNVeblUagxJ7WL6n8IiEHm
         x3vg==
X-Gm-Message-State: AFuF++mW6yTdL/GeuMXusNkwYwllPvMQEK8UoQPV6IJnJrQSY6scOR5V
	98fSAt75mWYMAnk3gR3KsAEEhDr5Dg0PsHaDjcfzdDUDcZ/FmXhMqF+6YztFekcfQkecT66w2Di
	MSsS6r4/y
X-Gm-Gg: AYBFou2ilof4RT5+TUQch1V+vzy6L27jnYTak4wNAKVwNP62THK6ck84uOzSNnUoiIr
	B3A2PdZ/BnyMp0e7OEwLIhi5fXdSMC/tGcAWcqIovdMZ1BiNJ5f+X3GcK2/WMZ/qf+CaEZGlIO0
	eZDM6CFwQTxbloYip4L++fjH9mr9tGFSJAR6kIY8ZKMt4AA4iGrvkB7RH+gdZVqCX/eXMYR4hwx
	j96VxG026Eca6uUD0oSX6ho3s25O/cu8j+H+wl5RFgdR8MWCNHFR0MCEZvlbtKMfGpi/kX14gpA
	KZ9ZCsyUv7I/0Iy6X7ZMLc9l3c1yNK8Im+2yNQkOWlVz6PPHztE5hfibobiKmxSGZSqBdKMjVkK
	HPxagex/hrBWQzGPpTC3WfOn7GjnfGm5veLnKmPjhnu+dwKcr+vK70sM3gi62qhT+5QDWhtHi1H
	73vTnIUpAxxOWyLemhdigHg48r4JWZweGyG7H4+oUgmRToa1jgNJCwSGMfbx6efnkTW5t/LpkLJ
	tbvd0XLTk8piBSwl65RT80yI+A9zJn5iXF8O4bq
X-Received: by 2002:a17:90a:dfcc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-396d0fd3a24mr51240975a91.11.1788245116284;
        Mon, 31 Aug 2026 23:45:16 -0700 (PDT)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com. [209.85.214.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d482c0dsm4203950a91.9.2026.08.31.23.45.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:45:16 -0700 (PDT)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d01663d816so3839645ad.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 23:45:16 -0700 (PDT)
X-Received: by 2002:a17:90b:314e:b0:398:c3ca:1ebc with SMTP id
 98e67ed59e1d1-398c3ca354fmr22614779a91.18.1788245114476; Mon, 31 Aug 2026
 23:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <NyIyntNSKnGNUZ9e_D85jiYUrnTPBu_Ux5olvRdPsK8lpjI8wYk-xb6sGrx9eK9iapaHROjWS3G2oeH5rkJyAiyjjYocn4CoYdvUoq92Pss=@protonmail.com>
In-Reply-To: <NyIyntNSKnGNUZ9e_D85jiYUrnTPBu_Ux5olvRdPsK8lpjI8wYk-xb6sGrx9eK9iapaHROjWS3G2oeH5rkJyAiyjjYocn4CoYdvUoq92Pss=@protonmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Sep 2026 08:45:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCu2=p_o8qNZeEOQB_um0YH_+3jefB=4xsC6k6Z349xtaQ@mail.gmail.com>
X-Gm-Features: AcwNN1Wg-qIkw0DjDvs-MshwFL8qNQ8_0oTAOVfxtEjdH-oEWxzt9AIWj9Aayqg
Message-ID: <CANiDSCu2=p_o8qNZeEOQB_um0YH_+3jefB=4xsC6k6Z349xtaQ@mail.gmail.com>
Subject: Re: Avermedia GC515 implementation
To: Edwin Gatier <edwin.gatier@protonmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Edwin

Looks like your camera is not following the spec. It says that it is
uvc 1.5 but behaves like 1.1


Could you try if this patch fixes it for you?

Regards!

diff --git a/drivers/media/usb/uvc/uvc_driver.c
b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..615cebb67508 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2851,6 +2851,17 @@ static const struct usb_device_id uvc_ids[] =3D {
          .bInterfaceSubClass   =3D 1,
          .bInterfaceProtocol   =3D 0,
          .driver_info          =3D (kernel_ulong_t)&uvc_quirk_fix_bandwidt=
h },
+       /* Avermedia GC515 */
+       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
+                               | USB_DEVICE_ID_MATCH_INT_INFO,
+         .idVendor             =3D 0x07ca,
+         .idProduct            =3D 0x1515,
+         .bInterfaceClass      =3D USB_CLASS_VIDEO,
+         .bInterfaceSubClass   =3D 1,
+         .bInterfaceProtocol   =3D UVC_PC_PROTOCOL_15,
+         .driver_info          =3D (kernel_ulong_t)&(const struct
uvc_device_info){
+               .uvc_version =3D 0x010a,
+         } },
        /* ViMicro Vega */
        { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
                                | USB_DEVICE_ID_MATCH_INT_INFO,

On Tue, 1 Sept 2026 at 02:45, Edwin Gatier <edwin.gatier@protonmail.com> wr=
ote:
>
> Hello,
>
> I'm trying to use the usb capture card x'tra go from avermedia but the uv=
c implementation is not very good from the vendor. The card falls back at u=
sb 2 speed (high speed detected) while it works fine on windows with usb3 s=
peed (super speed) which it as been designed for. Video stream should be 10=
80p120 and h265 compressed by the card.
>
> Plugging the card does nothing, the card is not recognized at all as seen=
 in the dmesg log, and subsequently is not mounted in /dev/videoX.
> I tried some quirks but didn't manage to pass the probe.
>
> You of course can contact me for more information.
>
> I'm on linux 7.2.2-1-cachyos with Wayland and have a dualboot with window=
s 11 on separate drive to update and test the capture card.
>
> Best Regards
>
> Edwin GATIER
>
> Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.



--=20
Ricardo Ribalda
