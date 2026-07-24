Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E595B47012C
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 22:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784932428; cv=pass; b=MGBMUVME/5OU//afyKDVaxvyOsDcw0Y86NUbFzXvVS8vw/5yTiDR8uptXj5/2GnDMcszv6rZLYpxbBDGhDAl4A8vqqSJkh8WPJ7W7ImFrl0midexPqum0RqCDs09WD7reXtx0VwwO3sGPQkHt0EHw6Rtc65Xe81Opmx5kSOrdxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784932428; c=relaxed/simple;
	bh=W3TINOp0YIg6cFAU+jVBD9KyqTBHvPUrrj/VY+7ekSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZozUxdoo0uOGOFnA741tvsDaLCrqs3K5bZsp+r7Sb0k9QydZaQj0IudGsqIpLtpLZdmdN4i26eQOvQM+LlPUH2VSrkf2lCg5ILiTmxbrxKy8B3UcqjUhbnmbasKg33Uwr1HAKYpR/8HXckKd3g3ctROoXle4n+AisU+acZaHgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=nV5/4MBB; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="nV5/4MBB"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-495b27007d0so452671b6e.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 15:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784932423; cv=none;
        d=google.com; s=arc-20260327;
        b=jgqbqf3OSbzebTjtMWTaXijf2e2yzjCpPmy4MsriMm5rSAkymlbTQpkmoz9If/Ne/g
         zSmXMZ6oknJlR837Z7FNoqVxAU43G2lds0D/EoAGziOmi/kDNNNx3ZzSo9qryabcyqnV
         7+75tBXoneHxXkPWwhcUcfmZ0m6OFM7/PHwNH5WsSdFMlMQm1/DLtX5nALXfSfnvd+DK
         OFUGovpOt7FqtU3gnUjypwKA+8sw4UKS0CyMcMQZ+aSETL7erKsZp3qnWjKL0f6fo/tX
         QJnalnY9y9cw0gc+pJmOLKcePpiyA3cK/9TZfalw906ORTeuEMUx1JmxNO3z7xdkIz8X
         TpdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+HO7q6d20+pdbuUml2R6D3hO7KN17hNSmjUtPTkxIM=;
        fh=WjMOReUcVF9HD/MkNE9ejrK4vrhL8ifJOGo0S7NCPv4=;
        b=VSnWNB7jWZkmQvVjEj6u/jwSmNTYwu8WyzCxoAntfrmwebuDnx6xtUJZmGtNQST4G4
         2jg+4rONn96rZMsf+O0JUPu58d8uBWi8zSAiDmuGMVHpisRFoFARzp2d/xX9vZFTzQOr
         gBnTPUFXXS9wF2w9bIbkW3u8TmYSj5e7dy9miAMm6eqEj6r7Qr1pYDgpXaFVMRyQLK3k
         PunH9Hrd7wzbL3zChiy5JugKTgR7LNskvnVMB9/tqbzHpbZ7ZoGkVkvJW4XExh4j3M56
         QwH3OMDuLfDtfC+DczMHf+NiaGYOvsOb2zvtWfULIyOWXEpgDJbbXjlKYL8j3tZ40NP8
         7RUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1784932423; x=1785537223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+HO7q6d20+pdbuUml2R6D3hO7KN17hNSmjUtPTkxIM=;
        b=nV5/4MBBg9PHOZhDnpJDoqV0IOj+KWme5FNPgmZqoCQOO0ZeV4bViOn9+bkVdKB/0O
         wshq6LoVyrXqAVnjeFJZIpR1NUEtHX9rRd4JeFIRkfckcRWYNHYWglEXwXgfvPS4QZhp
         q76v6hs5kk/4z7icdoBuTFBDKLmO2Y812eUBdbOfTIMo3NAWxlT279YZ2K3I4lUJGNrT
         HF5vWX0CgttPyxzmkc4/X1zBF/Un3/Cbuyvzhun0Kut5C8hOMzrHFx4QceOCEwLj9a2H
         gFs61QKzK90+vM2h6TcIjwQmMo/rhrxLTJ+1LO/Nu3Lk86JYFQG5bhHjZt1J1JnnUO4f
         A0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784932423; x=1785537223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+HO7q6d20+pdbuUml2R6D3hO7KN17hNSmjUtPTkxIM=;
        b=L/n1S4AE3r9MPleEdozS6RVRh6Cp3ckne/sOQgteKI6isWVMEb+W5J4yRMXAZ60rJH
         QJHrJojZiI5mECuJpNZic9Ynwdys4P6X+uOskfoc42oBM7OVc4M3xupmtWxagyIbEzWw
         KSfZjCtWTk1ZV+ofQMjh8qWWtsqMWCgQXfpNmo9IOlxVMlud0UxUHmTf8v4bIS2Fz/WR
         y5dgTnjJisvaYfHtSBYTJ7+mpWZEI8J1odEOFOZyZl1dOOEQE3dsEIS/jAcJ8c6KzhA8
         Uj+42DSC7NnY8LIbGTNvfna5ac3ui9OzCq+3pQW1ryrnDplUHc5DZRXY/K7LsygRSceP
         NApg==
X-Forwarded-Encrypted: i=1; AHgh+RpMC2a2SbI8Cc0K/rv6gOjMKocC17vKhMhLZm+hw9QhA4JgHoCrV4aB/47wAnSuKFr+oz9ZgIgilJJP0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhUzsUqFUgaE2wZuvDMc4S7TK9CkHy+kH6sknZ+au2jY5Z682N
	h1xm3BqtQEgLE4tODklwDarXkw07iD+0mBOKimka8E97Wyt6A3ue0auyMyUiFMjy9H5LRgmDaeZ
	gLCwxs5GldJng1DmFPzM4TfleUdNNO7tQeNsXbCr58WIfnFYa5akwm5SGkg==
X-Gm-Gg: AR+sD11Yzz5CzWSYZs6IBrYRWu8FBA2kwBc7Yf3hBRoFfFd0G+YbfigLGpPiUEWx5L8
	BOzUUb9zWFHIQtJD0PpviUTsLw/M3kHa9gyD1n0fON6TxWD0RJ8w/5fOgFOOqY+4p6UrPS+ijke
	wwaPD2Eb0yzNfSCYnmY8szWrZxqJxYTflJbKqQKrYI6/msW5ESeCfOFvSk1MKyYdg1RukwVEWsw
	Q2eFztN0770rDYyhOv8N7Zt2VqGH7aTx40OktaHnjc9gzoxu9GG44sdgYXYBL8=
X-Received: by 2002:a05:6808:c183:b0:4a4:adaf:5576 with SMTP id
 5614622812f47-4ab69f51d9emr403183b6e.4.1784932423493; Fri, 24 Jul 2026
 15:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709211918.958471-1-dkerasiotis@gmail.com>
 <471e276f-7ab8-4e49-bf1f-ae0f6b504a90@kernel.org> <CAA0YaJTjiAxXH4-A1yuUz_txAWnwmC=0Kt-p53Bb197Wm8C5mw@mail.gmail.com>
 <CADSHN4g-oRiqAVP8BHAU4d1cWjBHnNdnAj2f5wTSMx6uA59VcA@mail.gmail.com>
 <CADSHN4jM+1PT3PTTKkV0UTSHbm5xT56oSB3m5s_tccTnA0F3Hw@mail.gmail.com>
 <CAA0YaJSCMjKMkUneKDgNDuHLXbdLqYmsqNmP+enA=+R4QH9XiQ@mail.gmail.com> <CADSHN4itGxpyFyJ1+Pw5H9iSj1UwMBvhCKJMnr942qA_Nh_aCw@mail.gmail.com>
In-Reply-To: <CADSHN4itGxpyFyJ1+Pw5H9iSj1UwMBvhCKJMnr942qA_Nh_aCw@mail.gmail.com>
From: Bradford Love <brad@nextdimension.cc>
Date: Fri, 24 Jul 2026 17:33:32 -0500
X-Gm-Features: AUfX_mzR0RWBstID2NCyrLq1xXJlDHW4ORqIm0unQd8RR9-3gfAtFZLUCRJNUkA
Message-ID: <CAA0YaJSn5w7MS080V+wtMH53n=BvV9Pjd5odGYnJ-HDTpju0Rw@mail.gmail.com>
Subject: Re: [PATCH] media: cx231xx: fix si2157 inversion for Hauppauge WinTV-HVR-935C
To: Dimitris Kerasiotis <dkerasiotis@gmail.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dimitris,

The 975 is the "full" build with two demods. The other two devices
only have one demod populated, if you open yours you'll see a spot for
the atsc demod.

I configured my generator for your exact parameters, I find channels
whether I set my generator to invert RF or not. I tested 6, 7, and 8
MHz bandwidths to be sure.

What I do notice is that your firmware file is not the same version as
what we supply.

$ md5sum /lib/firmware/dvb-demod-si2168-b40-01.fw
b2670d8ae5e3369fc71edbb98cdd8f6e  /lib/firmware/dvb-demod-si2168-b40-01.fw

dmesg reports:

si2168 14-0064: firmware version: B 4.0.11

I would suggest finding and trying firmware 4.0.11 and reporting back.
I'm user ~b-rad on launchpad.net, you're welcome to extract it from my
linux-firmware-hauppauge package. I have not tested against 4.0.25 and
cannot verify that firmware works with our devices.

Regards,

Bradford






On Fri, Jul 24, 2026 at 4:11=E2=80=AFAM Dimitris Kerasiotis
<dkerasiotis@gmail.com> wrote:
>
> Hi Bradford,
>
> Thanks a lot for testing =E2=80=94 and for the 975 ATSC data point, that'=
s very
> useful.
>
> Here are the exact parameters of the muxes I'm receiving (Athens, Greece,
> Hymettus transmitter). All of them are plain DVB-T, no DVB-T2 in use here
> for the main national muxes:
>
> Bandwidth: 8 MHz
> Constellation: 64-QAM
> Transmission mode: 8K
> Guard interval: 1/4
> Hierarchy: none
> Code rate (HP): 3/4 on the DIGEA muxes, 2/3 on the ERT muxes
>
> Frequencies (all locked with inversion =3D false):
> 474 MHz (ERT) 482 MHz (DIGEA) 498 MHz (DIGEA)
> 522 MHz (DIGEA) 530 MHz (ERT) 546 MHz (DIGEA)
> 554 MHz (DIGEA) 578 MHz (DIGEA)
>
> Signal on the strongest mux (522 MHz), rooftop antenna:
> -48 dBm, C/N 33-38 dB, UCB 0, postBER 0, PER 0.
>
> With inversion =3D true the same mux never gets past
> FE_HAS_SIGNAL | FE_HAS_CARRIER (status 0x03) at that same signal level.
>
> One thing that may be relevant to reproducing this: my unit's Si2168-B40
> ships with ROM firmware B 4.0.2, and with that firmware the demod reports
> 0.00 dBm on every frequency =E2=80=94 no carrier detection at all. I had =
to add
> dvb-demod-si2168-b40-01.fw (which brings it to B 4.0.25) before I got any
> signal readings at all. The inversion issue only became visible after
> that. If your test units load a different demod firmware, that might
> explain part of the difference.
>
> On the 975 result: looking at the driver, the 975 attaches both lgdt3306a
> and si2168 to a single si2157, so the inversion flag is shared between
> the ATSC and DVB-T frontends. The 935C is si2168-only. It may be worth
> noting that the only other si2168-only board in cx231xx-dvb.c, the
> Evromedia Full Hybrid Full HD, already uses inversion =3D false, while th=
e
> lgdt3306a and si2165 boards all use true. That made me wonder whether the
> correct value is really demod-dependent rather than board-dependent.
>
> If that's the case, a question that would settle it: on your 975, does
> DVB-T lock reliably with inversion =3D true? If DVB-T is also marginal
> there, the 975 may need the flag set per frontend rather than per board.
>
> Caveats on my side: I only have one unit (model 111519, rev G2I6) and I
> have only tested DVB-T =E2=80=94 no DVB-C or DVB-T2 here to try.
>
> I'm happy to run any test you'd like on this unit, or to respin the patch
> in whatever form you and Hans prefer =E2=80=94 gated on the eeprom revisi=
on, or
> reworked so the 975 keeps true for ATSC while si2168 gets false.
>
> Kind regards,
> Dimitris
>
> On Fri, Jul 24, 2026 at 1:48=E2=80=AFAM Bradford Love <brad@nextdimension=
.cc> wrote:
> >
> > Hi Dimitris,
> >
> > I am testing this and investigating. I don't have a 935, but I have 955=
 and 975 of all revisions. The "family" consists of those three. Your findi=
ng would affect both 935 and 975.
> >
> > I will confirm that your patch does break atsc when using dvbv5-scan on=
 a 975, so while as is I imagine it's ok for 935's setup, there is somethin=
g else going on. The device you're using has been in production a very long=
 time, and you're the first to report such issue. It's just odd. I'm going =
to talk with hardware lead about exact revision changes. I need to reach ou=
t to our European support as well to have them test.
> >
> > Can you by chance give me your exact parameters so I can set my generat=
or up as close as possible to your Greek stations? Granted I don't have a d=
vbt2 generator, but there may be one in the main office. When I set my dvbt=
 generator up the rf output setting does not matter, both normal and invert=
ed work without issue when switching between for dvbt.
> >
> > Kind regards,
> >
> > Bradford
> >
> >
> >
> > On Tue, Jul 21, 2026, 12:30 Dimitris Kerasiotis <dkerasiotis@gmail.com>=
 wrote:
> >>
> >> Hi Hans, Brad,
> >>
> >> Thanks for looking at this.
> >>
> >> I can only confirm the behaviour on my own unit: Hauppauge model
> >> 111519, rev G2I6 (USB ID 2040:b151), tuner reported as Si2157-A30.
> >> With inversion =3D true it never locks on any DVB-T mux, briefly showi=
ng
> >> FE_HAS_SIGNAL | FE_HAS_CARRIER but never FE_HAS_LOCK, even at -48 dBm
> >> / ~33 dB C/N. With inversion =3D false it locks immediately and scans
> >> all 8 DVB-T muxes here in Athens, Greece cleanly (postBER 0). The same
> >> unit works under the Windows driver.
> >>
> >> I don't have a second 935C to test other revisions, so I can't tell
> >> whether this is universal or specific to this revision. I based the
> >> change on the fact that the Evromedia Full Hybrid Full HD, which uses
> >> the same cx231xx + si2168 + si2157 combination, already uses inversion
> >> =3D false.
> >>
> >> If it turns out to be revision-specific, I'm happy to respin the patch
> >> to gate it on the eeprom model/revision instead =E2=80=94 just let me =
know
> >> what you'd prefer.
> >>
> >> Regards,
> >> Dimitris
> >> On Tue, Jul 21, 2026 at 8:14=E2=80=AFPM Dimitris Kerasiotis
> >> <dkerasiotis@gmail.com> wrote:
> >> >
> >> > Hi Hans, Brad,
> >> >
> >> > Thanks for looking at this.
> >> >
> >> > I can only confirm the behaviour on my own unit: Hauppauge model 111=
519, rev G2I6 (USB ID 2040:b151), tuner reported as Si2157-A30. With invers=
ion =3D true it never locks on any DVB-T mux, briefly showing FE_HAS_SIGNAL=
 | FE_HAS_CARRIER but never FE_HAS_LOCK, even at -48 dBm / ~33 dB C/N. With=
 inversion =3D false it locks immediately and scans all 8 DVB-T muxes here =
in Athens, Greece cleanly (postBER 0). The same unit works under the Window=
s driver.
> >> >
> >> > I don't have a second 935C to test other revisions, so I can't tell =
whether this is universal or specific to this revision. I based the change =
on the fact that the Evromedia Full Hybrid Full HD, which uses the same cx2=
31xx + si2168 + si2157 combination, already uses inversion =3D false.
> >> >
> >> > If it turns out to be revision-specific, I'm happy to respin the pat=
ch to gate it on the eeprom model/revision instead =E2=80=94 just let me kn=
ow what you'd prefer.
> >> >
> >> > Regards,
> >> > Dimitris
> >> >
> >> >
> >> > On Thu, Jul 16, 2026 at 7:34=E2=80=AFAM Bradford Love <brad@nextdime=
nsion.cc> wrote:
> >> >>
> >> >> Hi Hans et al,
> >> >>
> >> >> I'm out of town currently but can run tests Sunday. I have models o=
f every generation, so I can test for inversion changes. I will run dvbt te=
sts and reply again.
> >> >>
> >> >> Regards,
> >> >>
> >> >> Bradford
> >> >>
> >> >>
> >> >>
> >> >>
> >> >> On Wed, Jul 15, 2026, 06:18 Hans Verkuil <hverkuil+cisco@kernel.org=
> wrote:
> >> >>>
> >> >>> Brad,
> >> >>>
> >> >>> Can you review this patch? I'm not sure if this 'inversion =3D fal=
se' is valid for just
> >> >>> one specific model, or if it is valid for all 935C models.
> >> >>>
> >> >>> I'm hoping you have some info about that, or are perhaps able to t=
est this with a
> >> >>> 935C.
> >> >>>
> >> >>> Regards,
> >> >>>
> >> >>>         Hans
> >> >>>
> >> >>> On 09/07/2026 23:19, Dimitris Kerasiotis wrote:
> >> >>> > On the Hauppauge WinTV-HVR-935C (USB ID 2040:b151) the si2157 tu=
ner
> >> >>> > is configured with inversion =3D true. On at least some hardware
> >> >>> > revisions (tested: Hauppauge model 111519, rev G2I6) this is wro=
ng:
> >> >>> > tuner and demod probe successfully, firmware loads (si2157 patch
> >> >>> > 3.0.5, si2168 B 4.0.25), signal strength is reported correctly a=
nd
> >> >>> > the Si2168 briefly reports FE_HAS_SIGNAL | FE_HAS_CARRIER, but i=
t
> >> >>> > never achieves lock on any DVB-T mux, on any frequency, regardle=
ss
> >> >>> > of signal quality (tested down to -48 dBm, C/N 38 dB). The same
> >> >>> > unit works under the vendor's Windows driver.
> >> >>> >
> >> >>> > Setting inversion =3D false results in immediate lock (FE_HAS_LO=
CK,
> >> >>> > postBER 0) and a successful scan of all eight DVB-T muxes receiv=
able
> >> >>> > in Attica, Greece. This matches the configuration already used f=
or
> >> >>> > the Evromedia Full Hybrid Full HD, which uses the same
> >> >>> > cx231xx + si2168 + si2157 chip combination.
> >> >>> >
> >> >>> > Tested on kernels 6.1 and 6.12 with identical results.
> >> >>> >
> >> >>> > Signed-off-by: Dimitris Kerasiotis <dkerasiotis@gmail.com>
> >> >>> > ---
> >> >>> >  drivers/media/usb/cx231xx/cx231xx-dvb.c | 2 +-
> >> >>> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >>> >
> >> >>> > diff --git a/drivers/media/usb/cx231xx/cx231xx-dvb.c b/drivers/m=
edia/usb/cx231xx/cx231xx-dvb.c
> >> >>> > index 472a4405a..a5486bcca 100644
> >> >>> > --- a/drivers/media/usb/cx231xx/cx231xx-dvb.c
> >> >>> > +++ b/drivers/media/usb/cx231xx/cx231xx-dvb.c
> >> >>> > @@ -1014,7 +1014,7 @@ static int dvb_init(struct cx231xx *dev)
> >> >>> >               si2157_config.mdev =3D dev->media_dev;
> >> >>> >  #endif
> >> >>> >               si2157_config.if_port =3D 1;
> >> >>> > -             si2157_config.inversion =3D true;
> >> >>> > +             si2157_config.inversion =3D false;
> >> >>> >
> >> >>> >               /* perform probe/init/attach */
> >> >>> >               client =3D dvb_module_probe("si2157", NULL, tuner_=
i2c,
> >> >>>
