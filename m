Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7C3A3821
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604218; cv=none; b=fqVoRfCzKcyb0p5GBsIHXhsyxcsdkU7ViAagYIe8BPw39mpf16kgdmlfltay9xnZeiZz0EuP6lDYfDTf6whH1o8bMKlWKpAGiL0YDhU/I+nk8jLuJ43GJBPgLb0u62fqxBhnvlHEqFU+pV53Gg3TUN9c4qpv2dgVRH36ccHYW2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604218; c=relaxed/simple;
	bh=nOhLwxUinnp+EKfvunI9tE5Mzri76nXjiAG6EMhp03I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ff4mEY2R749qIVUmk7nIVUZSFwoid0RiNoCB9gkgK31U/jJAgBPn2iI7Qz97VvpZYhyIcVA2hBqxDrk1uX1dE4AfgTqNiq3OPB+Rr23TiyCCl7emXt2PN7W9zsUk9npxfm3ciyFx47pnlOUswT1UL1PtLt1gIOAscEzmPavHZCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j3XcMzbI; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j3XcMzbI"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88098db8dcdso1130897b3a.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790604215; x=1791209015; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OfkeIgOAr8W95/lWVVLlZKauL7pPNd1iNdfWaeJ0T6k=;
        b=j3XcMzbIBcud4Ao8nEdoiGTSjnVkU/fwlcltL9gInar9jeGvaEcvolM8Pa/7oysrRT
         AbfjcX37eqWfSIYd2yQPQQjK3q2llkRzfk/nXqcr8toySO2b3CSOfiET9dVN9I/FPDvm
         QL6v12BLufyiVEUapVsgHF1iuJUMOYGepnoa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604215; x=1791209015;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OfkeIgOAr8W95/lWVVLlZKauL7pPNd1iNdfWaeJ0T6k=;
        b=hIznwz8jtGeYFfK2OepObqrzF0V316aCGaENZIKXg/CX/xNHsv0Tl2jyA23v4JmWaA
         fDm7aR3boqQ+rGEYvOjjTS+KfQ1BLkF6hTq4TAR3sYB9GzYrbR3QJfzlJHaUaiNGoDtP
         oXkwSqjt/dZfv8Dr377vQuvDRfDRdoa/QFdZwO2K3YRrlXE479ur/MhjBOUgZTiFjO4H
         qcGylTESY3q4DzauMIRzPusYwD1cyzYpAK/8EJu86oxIPQjqnUw1PaGfDXi421wlprln
         VRMMox+ViUvMnz3nHwNunO2q5CLYw7wlu1vLZnn+0GLqjjXNFXVE+OOaALFdKaJOQ/1j
         AM/A==
X-Forwarded-Encrypted: i=1; AKwUvBwB+iZH06wUrMhiEWfbfGkaHPiH3jLSB4aw5bRrvSFdikaa2Eck8FiKdnn9pBCbB8byrraPhOECISTJPw==@vger.kernel.org
X-Gm-Message-State: AFuF++msu2xTb1hdslgwXSVicPOz3qCLwPn3pdxms88Wc0UGEszyF0xK
	bPcL4N0rLnohmuXvKUQdCi/HmHwGuPAFRSjIvgxbBmxtkX+0zLzHjHe2ptRhmQ6yJ/zq1PHQ+I/
	TFHM=
X-Gm-Gg: AYBFou0b8CuaIx3jNfISsckBVuacjhqBqKvJij5O8zku1Y7/l5vs25D5gQu5T3lUsib
	Rx42U8UT3pBA5NnMC+jBWE7ZwzYCvtCFLIloq993wFEoKGWLLk7aX8fKV5ipq5eLTjSOXyXXISo
	k4mMeAnJR5PKHs8ki2Arc2Dmsdx3T4VFVN3OslmW1/JL0pw77xf1LRkNIIxLX37dMDbGIzyguHE
	RUaSP5XhujNEC3G/aHSq99YnzeG3Sd1d8I9kQ5ui5bjfMTEdd23M2r0gNWSpw+XeLPt9ayfZ97f
	+WKZhhhJtORAvpUueZdWX9B9M5RYWdSTQkfnGMtXLRqdAydm0hPlY5rUguQea5c6A0D93oCv1Ba
	9xroN4w6+r7iH+2A2gAJCS6/HnjuioUkj4mK7ruo2mp+sHbMAKRar0sSioRbPf16GjkyRvSgakj
	SxbVe1wUF+qcuLKaAL6IOkYXrGwnDEtbxg6IzbVZ1zbc5JbiKbag0B/qFmSwhTx6Wopt6SCV1kq
	o3N+qx1ON1oUrW0FV2L6j/Zp/HCkC1Db2p5vA==
X-Received: by 2002:a05:6a20:a123:b0:3de:5e37:26c3 with SMTP id adf61e73a8af0-3de5e37276bmr3053668637.29.1790604214796;
        Mon, 28 Sep 2026 07:03:34 -0700 (PDT)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com. [74.125.229.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78795dd54sm4607186a12.30.2026.09.28.07.03.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 07:03:33 -0700 (PDT)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144efd1ea76so1630142c88.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:03:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxdCtlwQYi0+n1pF9TL62N5y0tFXYuIMHnnGEv+/CNRhD+iQ2yqMVpR3gJykFGodPA2uOseIProf+XdMw==@vger.kernel.org
X-Received: by 2002:a05:701b:4186:10b0:143:5c63:23a1 with SMTP id
 a92af1059eb24-146ce680185mr10455491c88.19.1790604211213; Mon, 28 Sep 2026
 07:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uvc-ctrl-bound-v1-1-7b5cfc68bae1@chromium.org>
 <20260928120252.GB4406@killaraus.ideasonboard.com> <CANiDSCv5pd-3aO0Eb1-rvsAOGNpB4rhpjtnTosU6Ca+xBxN1qQ@mail.gmail.com>
 <20260928122450.GA166131@killaraus.ideasonboard.com> <CANiDSCuBFLYXFbq7Vox7AhdhftfzC9Ga6FKL-2F1o08cHQjoAA@mail.gmail.com>
 <20260928124109.GF157191@killaraus.ideasonboard.com>
In-Reply-To: <20260928124109.GF157191@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 16:03:15 +0200
X-Gmail-Original-Message-ID: <CANiDSCvvJd0_taNYvHm894kPpyOWQ+TaxC_XRVOs5qrUHod08Q@mail.gmail.com>
X-Gm-Features: AclHuK-bAdJr7VD1Kpb9pjJeCGhtkq2oBETN-wX0NINpxgYT65DJZrat6qMDKuY
Message-ID: <CANiDSCvvJd0_taNYvHm894kPpyOWQ+TaxC_XRVOs5qrUHod08Q@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix bounds for descriptor parsing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@skynet.be>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 14:41, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 28, 2026 at 02:35:29PM +0200, Ricardo Ribalda wrote:
> > On Mon, 28 Sept 2026 at 14:24, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Mon, Sep 28, 2026 at 02:10:26PM +0200, Ricardo Ribalda wrote:
> > > > On Mon, 28 Sept 2026 at 14:02, Laurent Pinchart wrote:
> > > > > On Fri, Sep 11, 2026 at 01:23:50PM +0000, Ricardo Ribalda wrote:
> > > > > > uvc_parse_control() passes descriptor by descriptor to
> > > > > > uvc_parse_standard_control() with the number of bytes remaining in the
> > > > > > buffer, not the number of bytes of that descriptor.
> > > > > >
> > > > > > Because of this, malformed descriptors could leak over the next
> > > > > > descriptor, leaving malformed data in our structures.
> > > > >
> > > > > What issue does this fix in practice ?
> > > >
> > > > Look into uvc_parse_standard_control().
> > > > Let's take the UVC_VC_HEADER
> > > >
> > > > Imagine we have a malformed control at the beginning of the descriptor that has:
> > > >
> > > > buffer[0] = 3
> > > > buffer[2] = UVC_VC_HEADER
> > > > buffer[3] => Beggining of next control
> > > >
> > > > With the current code, buffer[3...X] is parsed as UVC_VC_HEADER.
> > > >
> > > > What does it fix in practice? It avoids that data outside the controls
> > > > is parsed as part of the control.
> > >
> > > I understand that, but what does it fix in practice ? And have you
> > > encountered a device that exhibits such a problem ?
> >
> > I have not encountered such devices, but even if they do not exist
> > they are easy to emulate and use for escalation.
>
> That's what I'd like to understand, can this be used for any kind of
> escalation ?

It is very difficult (impossible?) to prove that something is not
exploitable, especially as the code evolves.
We could spend hours trying to craft a payload, plus extra time in
future reviews whenever uvc_parse_vendor_control() changes. It is much
safer to just enforce the correct bounds now.

As you said, the risk to break current hardware is low. If it happens
tis change is small enough to make it easy to revert.

>
> > We add minimal code and solve a family of bugs. Do you think that it
> > is a better pattern that uvc_parse_vendor_control() and
> > uvc_parse_vendor_control() have visibility beyond the control that
> > they are parsing?
>
> I'm concerned that some devices may stop working. The risk is likely
> small though, but I'd like to understand what we get from this patch to
> see if it's worth the risk.
>
> > > > > > Change the code so we pass the actual length of the descriptor to the
> > > > > > parser.
> > > > > >
> > > > > > Note that this makes the existing check more strict and some devices
> > > > > > that are wrongly parsed today will not be probed now.
> > > > > >
> > > > > > Cc: stable@vger.kernel.org
> > > > > > Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > ---
> > > > > >  drivers/media/usb/uvc/uvc_driver.c | 7 +++++--
> > > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > index e289cc71ba98..429f1ab19a2a 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > @@ -1248,11 +1248,14 @@ static int uvc_parse_control(struct uvc_device *dev)
> > > > > >        */
> > > > > >
> > > > > >       while (buflen > 2) {
> > > > > > -             if (uvc_parse_vendor_control(dev, buffer, buflen) ||
> > > > > > +             if (buflen < buffer[0] || buffer[0] < 3)
> > > > > > +                     return -EINVAL;
> > > > > > +
> > > > > > +             if (uvc_parse_vendor_control(dev, buffer, buffer[0]) ||
> > > > > >                   buffer[1] != USB_DT_CS_INTERFACE)
> > > > > >                       goto next_descriptor;
> > > > > >
> > > > > > -             ret = uvc_parse_standard_control(dev, buffer, buflen);
> > > > > > +             ret = uvc_parse_standard_control(dev, buffer, buffer[0]);
> > > > > >               if (ret < 0)
> > > > > >                       return ret;
> > > > > >
> > > > > >
> > > > > > ---
> > > > > > base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> > > > > > change-id: 20260911-uvc-ctrl-bound-9c1940f06fc7
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
