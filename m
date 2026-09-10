Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030733B8D48
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058794; cv=pass; b=k5a/rQAVfqZTK4+BhtfE8pt+C2gkMsDsD7mr53F5NgcW11zDKdc3+mFnBxWW4PtqnVyLsfvKbkL802FlrcJeAO8p1GN2zEW3ZPZUSlNRiWAdPLDuXZaq1mAtkQJRy4aE/UAQ0HXFtorqxgqz7hkvqbG1Q9uA0Vo5c7+MZYitXhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058794; c=relaxed/simple;
	bh=L3NFksDD7QUSPd3S/z0I+3+EX9IvKIW4aGMytpkFHq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRzkVtyhNJN1aX/7N3Fw8EEflQMUiX08Hd6B0L3KCypfZlsE9nIKfrQBQqH5gD5EstdlGyO+4URysnRxG400u+Zq4mxFuFgDwhowiLkRrXfanWPvr5U/8I+SRYCZSn9vKhTjgoHcNNCiAz+eGcbJ66sQJBppK4lHc8hQGB/Ruo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OlGNyYPQ; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OlGNyYPQ"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90e9e042ee1so73001436d6.1
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 09:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789058789; cv=none;
        d=google.com; s=arc-20260327;
        b=BQNf93oPj9eFaleHNu89utm1cjCEHOcVqFszpwJW0hcXDoss3cE+c6eWZjnrLy4QE1
         jjdR5SMwN8daoSeuGnTqmd25rl/Esv2tTqFvn9sftTOEWrqznNUlMnDqO/PvEIvJGsqE
         ZjLnNbarXun8PeDSO254lJPuYvl7+23bcjwOz7jW93AmcF6CYEsQlXyvcid/bHzVvVz1
         CA6f+TWmGuHsBwEniHKgq548h75+Hh2Yiu6xIVC9nktYX3FbVf2yNjT1UocD6BJIJChM
         WBXP/LcCfvFvJncYIUaBbdfcn4S2PZLLkOpYvGRoYhOPLcF54Dor79/SoNJsjM/h3LLD
         QyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dW3a3eYBFlUL8UXrgQaev8bdrBqkG2D9k/Qll/Jwu24=;
        fh=acXm/HWG9yYUEqiRgOikVw+HZhdC62s3yZnriEW0sJM=;
        b=LgU5QFdOM9xac0iGUdst1cC9w3xOAoqKtZSsQG6+oflHD1wvg+L85vqL/O/raAcp1o
         KYzQzROq7PSLmNhEHXlEuDlwqoA2Ye6GrX+nKlRy3snUJ2XCToZtiDXpfCzrx1Ckxnea
         uGO2sHBg/WLagkJqYpbQYZ/DM5bI7Xyy5FlpI2Orvna4f3XykekA32ckj34C1gJNUZt+
         KTWcPR6kaGrU5dTYRzNBkfdIAjUe+L3MxiZMhr9jvynxqF10uenZBcoGWZVXFyI9ij/J
         I1OPr1fkCnPlp7pJ/QHC0aKOMbMpS+O8wuKU+iN3ltNi5rm8+S+GIT9JRisNODbPrX9E
         NK8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789058789; x=1789663589; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dW3a3eYBFlUL8UXrgQaev8bdrBqkG2D9k/Qll/Jwu24=;
        b=OlGNyYPQ4eMJ7yIWgauFspPeJNtvd+O9q3CvD+M8HdPEs95+nT5as1tgqlPCw1w7Ih
         SB2u+WkHes9LZBVlDVMGaqhUNFV+7J++JsUHGzoUTkFYnV8vo42kG+EeoKWTlusfDpLk
         vQKKQTiEEOhMWKHUjVRHYxoL+iraiDUKh00X3FmugMDiHHesCg0KKOzWCPj8h9utzZ0c
         fGocNtwO82vTJn9h+eIrbikv3dyZLa2q+DbfXUqk+y+EAMH2kx9bNixVL60PO381GByt
         YPirzT28h0VzSoMhjm4xqDNwgRFltLfhgXlUDQgcqxlg3EYv7tL+UAjz5y5CLsMIflUK
         1U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058789; x=1789663589;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dW3a3eYBFlUL8UXrgQaev8bdrBqkG2D9k/Qll/Jwu24=;
        b=LlKJDHmIWh/EvRUuKsr4OzbdLXXiPC6VkOwepFxNnuy9eAO0xfpT123byen40becb3
         h7xECfd9teEXEvuZlG/Yi5NvDIfzxyVWAUdpTPEoL0JnjHWJNV3r+3LfxC3A4FQyuwYj
         Nr+ptwSTUtDLKFBf2yhYH56DceKkE2jtK9dzlrBk+wueuxg5ntkOb3qtci4MkM/uHK63
         Locq+tXZ3ZA6HAzc3GlMoBmO6j/SDI2wfHNkpAm2QVakK20OzKU5HaAs7n4iNr1NL93i
         a5TN3CrIAPepLlqCXchkrMIiYhyagKHyqnL8FS/Jv5MRNndcPCeNc/eWgYuRHdZ7dyqB
         q2mQ==
X-Forwarded-Encrypted: i=1; AKwUvBxa0gjPgPBCoDRybBKAA5BmapNfbVJNMWwyMwcTyyiqZbz3EgtnqJMQSoZt2pzvlWFSXA3Iq8OAv8KUWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k+Eu60SqcGrWizT0pmc8BqeL7lXs/LShEjFJS6BDypeLrm4hrK
	3/WKzfZ7pkIRdsdB6IrBL1BOau81fEeXTdUg/kl2k/qM9wTZCNWx8PaMapzt9yZOr0gzM1RGyPb
	jJRrFmzR1ToA0CjhOYq0f2N3n59mb8F1Ii2aN52UQGw==
X-Gm-Gg: AYBFou2VcLqxXBRWuPG+SBFUhgStKo4gKI9J5j+2fg0DaDBiqSN/m1SFlvBuF4x0C8U
	++1VaAOo9PKbJ4oyRy9voKRjivOP63jdgZ+XGC3ZgB07UwaDa0MO5PaPiH8SJZ+qUxEiHylKeJI
	Torh5+BZv5H4VBWCiih7jfIMTk9O9wmltQ4e50v82Uqsm5nfaWhnPnIeDXx6qmqEJd2iK4ZBVvq
	KKyNhbmCRii0pXyCY55oXFufy3e+592Fo3ThIm8V0x7LF/qjBk+pbm613/7dWaqc5G2JifYb96m
	ryrzj8c9sBe3qLRLmkTSKSoNy7t/pUIGi8rF4K/pZU52DzldlRn/0xHqE6gMt1qIvApTJ4nH49L
	jxMiNixK4h1AizBniWg4K6lK3XXq+xGo4hmryvNLVguK9u8lFtLfa1jscop93HaK2a0RJh+dO
X-Received: by 2002:a05:6214:5195:b0:907:c025:e4 with SMTP id
 6a1803df08f44-9103ef2dd58mr532150606d6.13.1789058788659; Thu, 10 Sep 2026
 09:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
 <20260717-b4-vchiq-isp-v3-4-fb8235e15c68@ideasonboard.com>
 <178815780973.1005982.10544870677125118283@neptunite.rasen.tech> <178904987755.11722.4550283822602391871@freya>
In-Reply-To: <178904987755.11722.4550283822602391871@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 10 Sep 2026 17:46:11 +0100
X-Gm-Features: AcwNN1UtOoh3OaA0_SgLtxNriYeBdNNXPUKlpJI3A-U73eH3dRlhkhbW05S55Wc
Message-ID: <CAPY8ntDJKggr3cKhE=mfrAhhSwt5h+KbH=saXPiPj-JKngKGNA@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] platform/raspberrypi: vchiq-mmal: Support bayer
 and gray formats
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Paul Elder <paul.elder@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Paul and Jai

On Thu, 10 Sept 2026 at 15:18, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Paul,
>
> Thank you for your review.
>
> Quoting Paul Elder (2026-08-31 12:00:09)
> > Quoting Jai Luthra (2026-07-17 20:04:19)
> > > Raw camera sensors often send data as packed or unpacked bayer and gray
> > > formats, which needs to be processed by the ISP.
> > >
> > > Add macros to support bayer and gray format FOURCCs in the MMAL layer.
> > >
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > >  include/linux/raspberrypi/mmal-encodings.h | 64 ++++++++++++++++++++++++++++++
> > >  1 file changed, 64 insertions(+)
> > >
> > > diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
> > > index eadf2e981408..1e13ebbaebf6 100644
> > > --- a/include/linux/raspberrypi/mmal-encodings.h
> > > +++ b/include/linux/raspberrypi/mmal-encodings.h
> > > @@ -69,6 +69,70 @@
> > >   */
> > >  #define MMAL_ENCODING_OPAQUE           MMAL_FOURCC('O', 'P', 'Q', 'V')
> > >
> > > +/**
> > > + * Bayer formats
> > > + * FourCC values copied from V4L2 where defined.
> >
> > Is this matching a requirement? I've noticed that 12-bit packed and SBGGR16
> > don't match the v4l2 fourcc, but the ones that you defined are nicer.

No requirement.
That comment comes from 2015 / 2017 when the firmware support was
being added/extended, and V4L2 was handy to copy where applicable.
https://github.com/raspberrypi/userland/blame/master/interface/mmal/mmal_encodings.h#L110
(10 years ago! I've been doing this job too long!)

> I believe these are what the VC4 firmware expects as the fourcc values. I
> don't know the historic reason why these were chosen, but we do use
> standard v4l2 fourcc here when dealing with userspace applications.
>
> I don't know if it's worth it to change these to match V4L2 fourcc,
> especially because we want to avoid breaking changes to the firmware.

I'm not intending to make any changes to the firmware for ISP support
as it would create a breaking change and a world of pain.

Drop the comment.
These defines are for the MMAL API, and that is to all intents and
purposes fixed now. Similarities to V4L2 are just similarities.

  Dave

> Thanks,
> Jai
>
> >
> > Paul
> >
> > > + */
> > > +/* 8 bit per pixel Bayer formats. */
> > > +#define MMAL_ENCODING_BAYER_SBGGR8     MMAL_FOURCC('B', 'A', '8', '1')
> > > +#define MMAL_ENCODING_BAYER_SGBRG8     MMAL_FOURCC('G', 'B', 'R', 'G')
> > > +#define MMAL_ENCODING_BAYER_SGRBG8     MMAL_FOURCC('G', 'R', 'B', 'G')
> > > +#define MMAL_ENCODING_BAYER_SRGGB8     MMAL_FOURCC('R', 'G', 'G', 'B')
> > > +
> > > +/* 10 bit per pixel packed Bayer formats. */
> > > +#define MMAL_ENCODING_BAYER_SBGGR10P   MMAL_FOURCC('p', 'B', 'A', 'A')
> > > +#define MMAL_ENCODING_BAYER_SGRBG10P   MMAL_FOURCC('p', 'g', 'A', 'A')
> > > +#define MMAL_ENCODING_BAYER_SGBRG10P   MMAL_FOURCC('p', 'G', 'A', 'A')
> > > +#define MMAL_ENCODING_BAYER_SRGGB10P   MMAL_FOURCC('p', 'R', 'A', 'A')
> > > +
> > > +/* 12 bit per pixel packed Bayer formats. */
> > > +#define MMAL_ENCODING_BAYER_SBGGR12P   MMAL_FOURCC('p', 'B', '1', '2')
> > > +#define MMAL_ENCODING_BAYER_SGRBG12P   MMAL_FOURCC('p', 'g', '1', '2')
> > > +#define MMAL_ENCODING_BAYER_SGBRG12P   MMAL_FOURCC('p', 'G', '1', '2')
> > > +#define MMAL_ENCODING_BAYER_SRGGB12P   MMAL_FOURCC('p', 'R', '1', '2')
> > > +
> > > +/* 14 bit per pixel packed Bayer formats. */
> > > +#define MMAL_ENCODING_BAYER_SBGGR14P   MMAL_FOURCC('p', 'B', 'E', 'E')
> > > +#define MMAL_ENCODING_BAYER_SGBRG14P   MMAL_FOURCC('p', 'G', 'E', 'E')
> > > +#define MMAL_ENCODING_BAYER_SGRBG14P   MMAL_FOURCC('p', 'g', 'E', 'E')
> > > +#define MMAL_ENCODING_BAYER_SRGGB14P   MMAL_FOURCC('p', 'R', 'E', 'E')
> > > +
> > > +/* 16 bit per pixel Bayer formats. */
> > > +#define MMAL_ENCODING_BAYER_SBGGR16    MMAL_FOURCC('B', 'G', '1', '6')
> > > +#define MMAL_ENCODING_BAYER_SGBRG16    MMAL_FOURCC('G', 'B', '1', '6')
> > > +#define MMAL_ENCODING_BAYER_SGRBG16    MMAL_FOURCC('G', 'R', '1', '6')
> > > +#define MMAL_ENCODING_BAYER_SRGGB16    MMAL_FOURCC('R', 'G', '1', '6')
> > > +
> > > +/* 10 bit per pixel unpacked (16bit) Bayer formats. */
> > > +#define MMAL_ENCODING_BAYER_SBGGR10    MMAL_FOURCC('B', 'G', '1', '0')
> > > +#define MMAL_ENCODING_BAYER_SGRBG10    MMAL_FOURCC('B', 'A', '1', '0')
> > > +#define MMAL_ENCODING_BAYER_SGBRG10    MMAL_FOURCC('G', 'B', '1', '0')
> > > +#define MMAL_ENCODING_BAYER_SRGGB10    MMAL_FOURCC('R', 'G', '1', '0')
> > > +
> > > +/* 12 bit per pixel unpacked (16bit) Bayer formats */
> > > +#define MMAL_ENCODING_BAYER_SBGGR12    MMAL_FOURCC('B', 'G', '1', '2')
> > > +#define MMAL_ENCODING_BAYER_SGRBG12    MMAL_FOURCC('B', 'A', '1', '2')
> > > +#define MMAL_ENCODING_BAYER_SGBRG12    MMAL_FOURCC('G', 'B', '1', '2')
> > > +#define MMAL_ENCODING_BAYER_SRGGB12    MMAL_FOURCC('R', 'G', '1', '2')
> > > +
> > > +/* 14 bit per pixel unpacked (16bit) Bayer formats */
> > > +#define MMAL_ENCODING_BAYER_SBGGR14    MMAL_FOURCC('B', 'G', '1', '4')
> > > +#define MMAL_ENCODING_BAYER_SGBRG14    MMAL_FOURCC('G', 'B', '1', '4')
> > > +#define MMAL_ENCODING_BAYER_SGRBG14    MMAL_FOURCC('G', 'R', '1', '4')
> > > +#define MMAL_ENCODING_BAYER_SRGGB14    MMAL_FOURCC('R', 'G', '1', '4')
> > > +
> > > +/* MIPI packed monochrome images */
> > > +#define MMAL_ENCODING_GREY    MMAL_FOURCC('G', 'R', 'E', 'Y')
> > > +#define MMAL_ENCODING_Y10P    MMAL_FOURCC('Y', '1', '0', 'P')
> > > +#define MMAL_ENCODING_Y12P    MMAL_FOURCC('Y', '1', '2', 'P')
> > > +#define MMAL_ENCODING_Y14P    MMAL_FOURCC('Y', '1', '4', 'P')
> > > +#define MMAL_ENCODING_Y16     MMAL_FOURCC('Y', '1', '6', ' ')
> > > +
> > > +/* Unpacked monochrome formats (16bit per sample, but only N LSBs used) */
> > > +#define MMAL_ENCODING_Y10     MMAL_FOURCC('Y', '1', '0', ' ')
> > > +#define MMAL_ENCODING_Y12     MMAL_FOURCC('Y', '1', '2', ' ')
> > > +#define MMAL_ENCODING_Y14     MMAL_FOURCC('Y', '1', '4', ' ')
> > > +
> > >  /** An EGL image handle
> > >   */
> > >  #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')
> > >
> > > --
> > > 2.54.0
> > >
> > >
