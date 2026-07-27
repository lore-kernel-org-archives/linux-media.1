Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA21363C6F
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165585; cv=pass; b=Wx2Y4+gl5li+6WpOqAKuZ2wSy3VDeQFX7IxAVJakRkTF2CSOTeUBFHDzyf1NAWgBaGfZjrnW3RQ6tXSPUvaSdeREMVsZh6IJ6hXcIzxHarFRxP8vkrYNXhAnlpUqgs9YCvzZb8+zBLdr+LInZ3SnfgWKPa0NwORSx68tSB+KbCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165585; c=relaxed/simple;
	bh=LI85LD7A9COJsrqGkmpvSUzsAWPWwbS1AvF0DpY5KEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bxNqAgIWkKXzKiWipV96DxzBbmYP2lKitS/gpw9Y044ihQmdiH9vYHCPbx1WoANe+0d6B1QTrD5yt6CB3d0UxHSHBJ8GQ/oTdk/yyetsD/TzFnGASN4SLKecZ2dsUIq0StTrTWfGIvIX5GR35ITjiFN63RLi21EQDVaNFwX75bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuTjb5o+; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuTjb5o+"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c8e65e3f5so23130271fa.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 08:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785165582; cv=none;
        d=google.com; s=arc-20260327;
        b=DQAxTGfFtLWzFg1CnkrqNmHvwi4ObIXiU9c0IHrtxAYgriFJsLLXcktps2RruVTeFa
         16xIFKKe/KHj88FVmNQV21hxMvG2RuDfMs8YecYnq4D5/Aj/gBM2g8eZqoW1BBZ+inDg
         ZkrQH9wpivYTAoq+eYAcoZMaVOXwu5WBfg15Tn2XGFCowpIVhA2foriKeMU6z8D2qi+M
         EzL6piKlO4BDVZH9os6DgCVaCSP5E74dzDFzdGY6hEQW/SC1yZiimIgTKndZO3tjzEXO
         Eq2VQ/8VRcAYDVKmmNd3d2oUwesWEDpxzA+n7K34uNAl6ebPYxYteZjT0elGcY3HNFfZ
         JfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MjqRBBcAoS4HsK51rTcy+DxJKBcKr3CODvGz8HMyOok=;
        fh=+RhY4TDYeFaN8QrqHsu2z7tFgasqzOYN0pM9nbfzu6c=;
        b=d7DQdizFXY7Z5TLJI50tRanr4a6EwjZeUJ0AcElDkOBX3iLD/05+r7GSCC5yx0Ir4x
         GV9O68rHzYe6qVwhzaFhUiQmxXpVp0DSbnFb8hrwUXHYwZfHAPhJB6BYB+Ackkforwcz
         sNUyTS1VElydBF3lhdPpo0kOSRabXrNgxEuKjSMF+EcrTZbpPE7wCO9CW6QCs6/ooMxB
         HKmEidpcH0eHk8scbuT2bLmvE7WElEXoJlmN7qGeeAqdFx8iM3S4/cS4suSxMdUQmVcJ
         8u7y55Zvf9Ba+EXwHvBbecDA+hz6z4di4+AuzoLrOG7Q6g/kdZtlsVSRweqB/f5jblrF
         Cs8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785165582; x=1785770382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MjqRBBcAoS4HsK51rTcy+DxJKBcKr3CODvGz8HMyOok=;
        b=YuTjb5o+uFg+vII3GQnNd3QS0l63cjuwhJTUt7dGipNgrfo+q4bzb/yC5zqdF589uh
         oc9EA2aK4Pfby5xAmJD/n39+yFSv82SBTjwp9RSuhG2eerYfmhFNjBZGuwxkbjZ57XgG
         5tbCki2O1tzIiU7I0sypd2R/4iGkMYZAAwRoASxbkzzt8AVbR/lhuQEHbO/eqZYfJk8N
         WiczKkdgufRm+xQKpVSoLaMzU7stLQ2DSsCX/5q3GLuKubUEfqd3KjlLyBiVvruBagEr
         H+eiy4iHVB1bLocM7LICEJvFIB8p4NB0ui5lRnE2XOtsZHrtbozT0onV5ewAG8/00Ajf
         ubDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165582; x=1785770382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjqRBBcAoS4HsK51rTcy+DxJKBcKr3CODvGz8HMyOok=;
        b=GaPTKya5MI29GK4auGLI4VHqNWEyQK4DqNeqchilcJw3GVr4+D+/4Y9ZdJI/CJpLog
         g0xP6mvnpwkoPOQVmzZcGuamVt8TpacMtrYnaWspX26bZAsOI2C16b5d+ioTVPETPMbs
         F6+pshESQ+5kRMPXWoyIL5ylwXb/kCidz76A4CaLtDGqKrsA0P3rhVew8vFd6Soepzz5
         kqqsXjtEe8Wi0a+fY/Tc/FBgxZICV/KXwYjEXLjrD7mL6bDcJ4MH128fUY4heiaZdEB8
         gzFQ7SGqu/uA0VLAH6Mz+k6NgdNgDxTMo9e1hgfUnS4udspPz/iWHCpPoUhJK6KtAoU1
         /wsg==
X-Gm-Message-State: AOJu0YxRc5iPgycnTJGhOsmH6i1nVvUTGLXE/vPA6RinLbsrCvi+5Sm5
	rB5Y3oMRTGLyTq4RuK4x5IbGS3FnsjoLEICMYscLYuT5TLXfhHHGmI1pa3RSg7AImm875fdxoD9
	HJ8ZSr1y6sJ5bXU86ymEbKRjvkerX57uEWg==
X-Gm-Gg: AR+sD135YqdjtgCGITIQQpNKYmW0OmKh8TBUi+NKX3xL+3jDBfuuAx2zi/gYBCBxpHl
	fYeL6CZGMeapG8iH3eWpKPUvcgHm/5PO/VAh1OPZnzoZ6eftmb8vTKarprXUiqrEk6COO10Lz7c
	H1jzAML/3egJVTKndnSLiqQV9YmZ1f8d9ikpPZvyG8cV1+xN9x1TJvCkPhjD0qPswUEid6yrxJ9
	Qls+IE3wrzryB0FPAM/5dUUN2VkiWTRJhlKG4T3rvwohG8geQ1SgYR2m3tGD1oO9UKifw4=
X-Received: by 2002:a2e:bcc7:0:b0:39c:71f9:26c1 with SMTP id
 38308e7fff4ca-39f4ca93786mr20131fa.37.1785165581462; Mon, 27 Jul 2026
 08:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB-99LvD2cCmPt91Kh-1Zj69=_xczV6oUA7soAfFXQBcZxA+pQ@mail.gmail.com>
 <CAO3ALPx9FK=ayO8WWt7zguTfaA=e5q2wxUPc1ojpPFqFvstxBA@mail.gmail.com>
 <CAB-99Lu1+OB0OyKQLh9Y89+BdLc23j6nJAn59VbS9qVwAb-4vw@mail.gmail.com>
 <CAO3ALPxbYGG5fxO1Dd989bjg=a4xRLBSDwtDL41Bd9ym7pt6KQ@mail.gmail.com>
 <CAB-99Lt=XkfAa6aOvug9101qWOaLsQN7a0ss7bZ1OmPvvTETsg@mail.gmail.com> <CAB-99LvB7kigD5Z2StaDmBLwQJPmKytihN9APUzyz7J=WRw67Q@mail.gmail.com>
In-Reply-To: <CAB-99LvB7kigD5Z2StaDmBLwQJPmKytihN9APUzyz7J=WRw67Q@mail.gmail.com>
From: Michael Goffioul <michael.goffioul@gmail.com>
Date: Mon, 27 Jul 2026 11:19:30 -0400
X-Gm-Features: AUfX_my866FYZolWY5YKcYONtPxV073yhZ1VAIaQxA4xppbEQpHD4iIrH8El9nU
Message-ID: <CAB-99Lti_T60j08tRdd4o=ZGfJQORLk0GJUdd9pZsV9vLTLRAQ@mail.gmail.com>
Subject: Re: Support for Mygica A681B (ATSC/QAM USB tuner)
To: Forest Crossman <cyrozap@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 5:39=E2=80=AFPM Michael Goffioul
<michael.goffioul@gmail.com> wrote:
>
> On Tue, Jun 23, 2026 at 10:30=E2=80=AFPM Michael Goffioul
> <michael.goffioul@gmail.com> wrote:
> >
> > On Tue, Oct 14, 2025 at 1:42=E2=80=AFPM Forest Crossman <cyrozap@gmail.=
com> wrote:
> >>
> >> On Tue, Oct 14, 2025 at 9:13=E2=80=AFAM Michael Goffioul
> >> <michael.goffioul@gmail.com> wrote:
> >> >
> >> > On Fri, Oct 10, 2025 at 11:22=E2=80=AFAM Forest Crossman <cyrozap@gm=
ail.com> wrote:
> >> >>
> >> >> On Sun, Jun 22, 2025 at 8:46=E2=80=AFPM Michael Goffioul
> >> >> <michael.goffioul@gmail.com> wrote:
> >> >> >
> >> >> > Hi,
> >> >> >
> >> >> > I have a Mygica A681B USB tuner and I'm wondering whether there's=
 any
> >> >> > hope to have it supported by the Linux kernel. I've attached the =
lsusb
> >> >> > output for the device at the end of this email.
> >> >> >
> >> >> > So far, I've downloaded the Linux driver from Geniatech web site.=
 This
> >> >> > is made for Ubuntu 20 and kernel 5.4. From what I can tell from t=
he
> >> >> > driver sources, the device 1f4d:692f seems to use a mxl692 fronte=
nd
> >> >> > driver, but it uses a binary-only mxl692_fe.o module, without
> >> >> > providing the source code for it. Kernel 6 includes its own mxl69=
2
> >> >> > driver, however it appears to use a different interface/API (and
> >> >> > apparently also a firmware blob that does not look to be easy to
> >> >> > find...).
> >> >> >
> >> >> > Any help or hint would be greatly appreciated.
> >> >> >
> >> >> > Michael.
> >> >>
> >> >> Hi, Michael,
> >> >>
> >> >> I've recently submitted some patches [1] to enable support for the
> >> >> A681B and its more-compact USB-C sibling, the PT682C. The patches a=
re
> >> >> not yet ready for mainline (hence why I marked them "RFC"), but
> >> >> they're good enough to get the hardware working and streaming TV fr=
om
> >> >> over the air. If you're willing to patch your kernel, the patches
> >> >> should get you up and running while you wait for support in mainlin=
e
> >> >> or your distro's kernel.
> >> >>
> >> >> Also, while the cover letter for the patch series contains a link t=
o a
> >> >> script I wrote to download and extract the firmware image from the
> >> >> Windows driver, I recently learned that the firmware can simply be
> >> >> downloaded directly from here [2].
> >> >>
> >> >> I hope this helps!
> >> >>
> >> >> Forest
> >> >>
> >> >> [1]: https://lore.kernel.org/linux-media/20251001051534.925714-1-cy=
rozap@gmail.com/T/
> >> >> [2]: https://github.com/LibreELEC/dvb-firmware/blob/90261ae2934329f=
6ca84dd6c72d10d0777bf4b0e/firmware/dvb-demod-mxl692.fw
> >> >
> >> >
> >> > Hi Forest,
> >> >
> >> > Thanks for the info. I will give it a try when I get a chance.
> >> >
> >> > Do you know whether this would support Clear QAM too? While I had so=
me
> >> > success with ATSC with some reverse engineering, I was not able to g=
et
> >> > the device to work with QAM (with the device directly connected to a
> >> > VeCOAX modulator).
> >> >
> >> > Thanks,
> >> > Michael.
> >> >
> >>
> >> Michael,
> >>
> >> No, I don't think QAM works yet. The message for the commit that added
> >> the mxl692 driver to the kernel mentions that "Only ATSC is currently
> >> advertised via DVB properties. QAM still has issues." And the patch
> >> series cover letter[1] mentions "The ATSC portion works fully, the QAM
> >> portion needs some TLC and is therefore not listed in the DVB
> >> capabilities." Since no commits have been added since then to get QAM
> >> demod working, I think it probably still doesn't work. Not that I've
> >> tried, though--my first objective was to just get the driver for the
> >> A681B and PT682C working, then maybe later if I could get a Clear QAM
> >> source up and running (I have some SDRs that can do this, but I
> >> haven't used them in years) I'd try getting QAM demod working.
> >>
> >> All the best,
> >> Forest
> >>
> >> [1]: https://lore.kernel.org/all/20210126015416.5622-1-brad@nextdimens=
ion.cc/
> >
> >
> > Forrest,
> >
> > I finally found the time to try your driver and I was able to use the M=
yGica A681B device on my desktop with ATSC. Additionally, using the attache=
d patch, I was also able to use Clear QAM (both 64-QAM and 256-QAM, using a=
 DekTec modulator as source). So, thanks for the driver.
> >
> > That being said, it didn't work well when using the device connected to=
 an Android device (which is my target platform). Although the streaming wo=
rked, there were regular streaming errors (video pixelation and buffering e=
vents) making the device unsuitable for normal usage. A Hauppauge WindTV du=
al-HD device, used in the exact same test conditions (just swapped with the=
 MyGica one), worked flawlessly. I didn't observe the same issues  either, =
when using the MyGica device on my normal desktop. I'm not sure whether it =
might be due to the limited resources of the Android box, but if you have a=
ny suggestions, please let me know.
> >
> > Michael.
>
> It turned out the problem was due to a combination of factors:
> - high rate of IRQs generated for USB/xhci (~ 1250 IRQ/s)
> - Android handles most IRQ on the first core (there's no irqbalance in AO=
SP)
> - busy core due to video playback (among other tasks)
> This introduced latency in IRQ handling and eventually packet loss.
> The WinTV device was not affected, because the IRQ rate was 10x
> smaller (~ 130 IRQ/s). So I changed the buffer size defined in dvbsky
> driver for mxl692, from 4096 to 32768, and that solved the issue for
> me.

I got my hands on another instance of MyGica A631B device. However
that device has a different product ID: 0xa681, instead of expected
0x692f. From what I could find on the web, that product ID is used for
A681 device. I suspect this is some sort of rebranded A681. The driver
stack that I've used with the first device does not work with this new
one: it goes up to the fw upload, then the I2C status check performed
by mxl692 driver times out and the device is non-functional. Anybody
had any luck with the A681 device?

Thanks,
Michael.
