Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBC038DC6E
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785337542; cv=pass; b=pqHtBxQHjq+L0BuwOwp9GL3udflAkP+8PFH38wkRaPYchfELrssZplcReQJGdw1tn7jsA5kPiJn4/R9VQwfDwg/TlHHXec3OQZgl4qjdNl3wG4rJAr6bcd2CFxWEUrfQwubi0jBsVmBtayZShKxMSjeO2HsVBIWL+4QOnQ7+fEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785337542; c=relaxed/simple;
	bh=hzxXXH7l4SpV8MEhzxuJMDGZNqPUZ9J3aUTxA+HmCXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrshUwCBnsUUb1lV1iAmJ4Qc4QnQGYFB48xYqSLugP3K/YBbN7ADCo3Kd+Bt5YwSG/UAW0pXRThRBvmFq/+yFst/yT0+GGbs2Os9ziqozwGWYdDUkrlLbEqXrxn05VxzXut5yCi+xPbgP8caKcTW53x7ZrPS/HpdE8zocS21oL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1FrN2Kv; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1FrN2Kv"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-472326ca506so799561f8f.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785337538; cv=none;
        d=google.com; s=arc-20260327;
        b=Nrt4hF8bZrTln0BeVJrYd2x4EbL1q4ugiLF3jJimV2vXNHRDwRkFKbKaSpsfiqgyRF
         +DXJ4oetqUBMCAWzIeAeyS8ySluLxNujc3XLAKvTgIwUhD+NUfu+1Lfaz0rgNBFxuKl+
         Oi0CmJ6Im61+BxDJGNHS5eln6u645MhM99hwt0VFANqfsVO0U5Ul8g1z5UQ/hUaFjfN0
         JZRa3MAYoP/WrPUu1Yp0c6Z49GdOHsc/KxajQLYwyojPcXuozJgHT10oAqcp3pN2DX6+
         z2qgW98Pr9fdjxdO0WODA1qxEn7GDRR9F7Zh7GmhkwSVL55EWFqsEIoewfwYD5ot15W+
         6YUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W9tHHvNnOD9oSYrKTw7pNdumMHfWlHYrNnJ8Y0NTSqM=;
        fh=aueGaEX3GpWCWCF/h1jWSipnnd5UuAq+6RArUqs3dwg=;
        b=NwXsNBHa+cK/z+Sm+fSvh6keFdiQiRn6RJw4eY0sCo23iYMV/XOmIar7sSHzS+W2Bg
         9psLREBGJt1dPsjMEL95pwWO9G3snVkLwiJnUkdF9xjhH4ZVLezzV7orEOwtfMAfdeDG
         dCC6bvBY71WVw/Btr7WmpyHceqO7ODv8o4rXBKy4KRpwZKv9craKwuxwEXVZuygHiuYi
         rdvHO6bO47pJq59/46HhSi/RBs0DH99iR4XXIZ20dcOyKbtJCBfuQ7eSk+dxmPRnVVQO
         5Gq+ivuBqUbb5PVHwiBZmWr3IF8z8HMiwy2u7txOjCaaZdV+xD8BVhdpnUYkXDiYDoNA
         VH9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785337538; x=1785942338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W9tHHvNnOD9oSYrKTw7pNdumMHfWlHYrNnJ8Y0NTSqM=;
        b=e1FrN2KvWFH0Z1ROHRhdGvc96nyT95PcZQYSycpoxAXk1G19a867sqi3XquBxaDN+m
         G3fzVrzt2XpS6zmgPBdaylj7w+hQZFw21S8dtidVrOR584wJ04IKXNSZNOaHvmP3vxGN
         XFsMSdDe3ONyOUGPrw0nx1q8wkwTDEnXAGpY1XGBDbF0HhmWaMfNpYbiLS/bcP9pvg35
         3OCdTDQqLbPqXMt2Dfzz5sqeBfWjA9f2qPREo1hfnLkn5Ifp1iw3DZh5yUN5iz6UfdkD
         aqKTvy3wIDFFbwCLflNWrietpX6BZcy3QR09LG+dj/XHLJAiiwtiM2VGtRyNsR6jd8QU
         WnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785337538; x=1785942338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9tHHvNnOD9oSYrKTw7pNdumMHfWlHYrNnJ8Y0NTSqM=;
        b=UZU3u/CeLXTjR1Q2dIfr/zlhCqHyV1gY6HEdwMsbjCU33+HtL7TdFpRe7OYS+vj3pA
         e99tJScWmUv0gY0nzqluZ7Tao+S/csDn/frkWSkvevRei1dIrUFFkJ/FLVbuo7tRBt+Q
         vcoZD5TbYRmjvp1W869g6dOYJKDtTGT6Iqx/kM88amudU3DyKycwtiB2UhbG7WtfjrK0
         J7dDKGHEY4wvuaHl9StStAYj2PQUK2+5ZyMsxsFrK7DMm+Po38z+skdvWQA1/8WiSm7D
         PsnNIeV5Xgz9vXj5CvEHfZTyw9QCNiTsP+V4gISibTqppIs6Dq4S+VUOH3Rr0V9ADQju
         7VPA==
X-Forwarded-Encrypted: i=1; AHgh+RqYoDPTnVIAz867iZR40uPT+C+BAttru7wPizCeIh/XQKo+1F009CMFRqseI5iIWx1SulUB6BHnEV/7EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylgeiRM03W6AZctGvLeQxJIh8Sy3WqXwkz0n9jUQ/NRP6r3QeD
	4m8qxecEWAqdckoOqzJka5j0pEiNLV/Eb68EfSn6DdGMPJMzLPNPJ9WVeI72gt46wr2XSoArnow
	2u7ON7PAOcHaBGtLuL2rHQc1xoqk9nig=
X-Gm-Gg: AR+sD12/7zngNyOvwbEITb1oUT/e0brhCgZa9K2UuDki5xl5fPJCNeiG5hLl6uTd3s+
	w8DSdfzJG2Ersohk8nEUV4rm06H4FwXqQoS9/MMrle5gIVdfHyj0eB/LVB2E5nqrlWs4uArTmzW
	2Jf/dnyJPwwoDFoLdqHMcpq7rjsg3NBp5qRcdNxOZBVLlCxnhE4tfdKaa/M9ntx5FGjOGWODcqQ
	ej+AdFBR7/d9BPiSg8lWkmey3S8Vkfiq4+OcUGjV6YKmbHe8jDnn784l0Z033zUqc2Y+YAHOPaK
	CMt3eDxosqmBPC+492NCKqclIlVBSepXACFxZ/sAPWE=
X-Received: by 2002:a05:6000:2404:b0:47f:923c:9d92 with SMTP id
 ffacd0b85a97d-47fb1f1f32cmr8183828f8f.51.1785337537691; Wed, 29 Jul 2026
 08:05:37 -0700 (PDT)
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
 <CAA0YaJSCMjKMkUneKDgNDuHLXbdLqYmsqNmP+enA=+R4QH9XiQ@mail.gmail.com>
 <CADSHN4itGxpyFyJ1+Pw5H9iSj1UwMBvhCKJMnr942qA_Nh_aCw@mail.gmail.com> <CAA0YaJSn5w7MS080V+wtMH53n=BvV9Pjd5odGYnJ-HDTpju0Rw@mail.gmail.com>
In-Reply-To: <CAA0YaJSn5w7MS080V+wtMH53n=BvV9Pjd5odGYnJ-HDTpju0Rw@mail.gmail.com>
From: Dimitris Kerasiotis <dkerasiotis@gmail.com>
Date: Wed, 29 Jul 2026 18:05:26 +0300
X-Gm-Features: AUfX_my-ihm4Tsyxa97KQjhO4FYu28maCu2oxJl1KcNDikxdUeRqrpq2CrKBhKY
Message-ID: <CADSHN4hwhycAqVoH=QCL+Of4wPmz8Tpy=Ja=3rZar1e+-CxLuQ@mail.gmail.com>
Subject: Re: [PATCH] media: cx231xx: fix si2157 inversion for Hauppauge WinTV-HVR-935C
To: Bradford Love <brad@nextdimension.cc>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brad,

I extracted the 4.0.11 firmware from your
linux-firmware-hauppauge package (md5 matches yours:
b2670d8ae5e3369fc71edbb98cdd8f6e), restored the stock unpatched
module (inversion =3D true), and the result is an immediate, clean lock:

Lock (0x1f) Signal=3D -49 dBm C/N=3D 37 dB UCB=3D 0 postBER=3D 0

dmesg confirms: firmware version: B 4.0.11

So the mainline driver is correct as-is, and the problem was entirely
the firmware I had installed: the 4.0.25 build distributed in the
LibreELEC dvb-firmware repository does not lock with inversion =3D true
on this device =E2=80=94 my patch was unknowingly compensating for that.
Please consider the patch withdrawn.

Hans, apologies for the noise, and thanks for routing this to the right per=
son.

One thought: since the LibreELEC repo is one of the first search hits
for this firmware file, other users may hit the same silent failure.
If there is a canonical location you'd like people directed to for
the 4.0.11 file, I'd be happy to report the incompatibility to the
LibreELEC dvb-firmware maintainers as well.

Thanks again for taking the time to set up the generator and test =E2=80=94
much appreciated.

Kind regards,
Dimitris

On Sat, Jul 25, 2026 at 1:33=E2=80=AFAM Bradford Love <brad@nextdimension.c=
c> wrote:
>
> Hi Dimitris,
>
> The 975 is the "full" build with two demods. The other two devices
> only have one demod populated, if you open yours you'll see a spot for
> the atsc demod.
>
> I configured my generator for your exact parameters, I find channels
> whether I set my generator to invert RF or not. I tested 6, 7, and 8
> MHz bandwidths to be sure.
>
> What I do notice is that your firmware file is not the same version as
> what we supply.
>
> $ md5sum /lib/firmware/dvb-demod-si2168-b40-01.fw
> b2670d8ae5e3369fc71edbb98cdd8f6e  /lib/firmware/dvb-demod-si2168-b40-01.f=
w
>
> dmesg reports:
>
> si2168 14-0064: firmware version: B 4.0.11
>
> I would suggest finding and trying firmware 4.0.11 and reporting back.
> I'm user ~b-rad on launchpad.net, you're welcome to extract it from my
> linux-firmware-hauppauge package. I have not tested against 4.0.25 and
> cannot verify that firmware works with our devices.
>
> Regards,
>
> Bradford
>
>
>
>
>
>
> On Fri, Jul 24, 2026 at 4:11=E2=80=AFAM Dimitris Kerasiotis
> <dkerasiotis@gmail.com> wrote:
> >
> > Hi Bradford,
> >
> > Thanks a lot for testing =E2=80=94 and for the 975 ATSC data point, tha=
t's very
> > useful.
> >
> > Here are the exact parameters of the muxes I'm receiving (Athens, Greec=
e,
> > Hymettus transmitter). All of them are plain DVB-T, no DVB-T2 in use he=
re
> > for the main national muxes:
> >
> > Bandwidth: 8 MHz
> > Constellation: 64-QAM
> > Transmission mode: 8K
> > Guard interval: 1/4
> > Hierarchy: none
> > Code rate (HP): 3/4 on the DIGEA muxes, 2/3 on the ERT muxes
> >
> > Frequencies (all locked with inversion =3D false):
> > 474 MHz (ERT) 482 MHz (DIGEA) 498 MHz (DIGEA)
> > 522 MHz (DIGEA) 530 MHz (ERT) 546 MHz (DIGEA)
> > 554 MHz (DIGEA) 578 MHz (DIGEA)
> >
> > Signal on the strongest mux (522 MHz), rooftop antenna:
> > -48 dBm, C/N 33-38 dB, UCB 0, postBER 0, PER 0.
> >
> > With inversion =3D true the same mux never gets past
> > FE_HAS_SIGNAL | FE_HAS_CARRIER (status 0x03) at that same signal level.
> >
> > One thing that may be relevant to reproducing this: my unit's Si2168-B4=
0
> > ships with ROM firmware B 4.0.2, and with that firmware the demod repor=
ts
> > 0.00 dBm on every frequency =E2=80=94 no carrier detection at all. I ha=
d to add
> > dvb-demod-si2168-b40-01.fw (which brings it to B 4.0.25) before I got a=
ny
> > signal readings at all. The inversion issue only became visible after
> > that. If your test units load a different demod firmware, that might
> > explain part of the difference.
> >
> > On the 975 result: looking at the driver, the 975 attaches both lgdt330=
6a
> > and si2168 to a single si2157, so the inversion flag is shared between
> > the ATSC and DVB-T frontends. The 935C is si2168-only. It may be worth
> > noting that the only other si2168-only board in cx231xx-dvb.c, the
> > Evromedia Full Hybrid Full HD, already uses inversion =3D false, while =
the
> > lgdt3306a and si2165 boards all use true. That made me wonder whether t=
he
> > correct value is really demod-dependent rather than board-dependent.
> >
> > If that's the case, a question that would settle it: on your 975, does
> > DVB-T lock reliably with inversion =3D true? If DVB-T is also marginal
> > there, the 975 may need the flag set per frontend rather than per board=
.
> >
> > Caveats on my side: I only have one unit (model 111519, rev G2I6) and I
> > have only tested DVB-T =E2=80=94 no DVB-C or DVB-T2 here to try.
> >
> > I'm happy to run any test you'd like on this unit, or to respin the pat=
ch
> > in whatever form you and Hans prefer =E2=80=94 gated on the eeprom revi=
sion, or
> > reworked so the 975 keeps true for ATSC while si2168 gets false.
> >
> > Kind regards,
> > Dimitris
> >
> > On Fri, Jul 24, 2026 at 1:48=E2=80=AFAM Bradford Love <brad@nextdimensi=
on.cc> wrote:
> > >
> > > Hi Dimitris,
> > >
> > > I am testing this and investigating. I don't have a 935, but I have 9=
55 and 975 of all revisions. The "family" consists of those three. Your fin=
ding would affect both 935 and 975.
> > >
> > > I will confirm that your patch does break atsc when using dvbv5-scan =
on a 975, so while as is I imagine it's ok for 935's setup, there is someth=
ing else going on. The device you're using has been in production a very lo=
ng time, and you're the first to report such issue. It's just odd. I'm goin=
g to talk with hardware lead about exact revision changes. I need to reach =
out to our European support as well to have them test.
> > >
> > > Can you by chance give me your exact parameters so I can set my gener=
ator up as close as possible to your Greek stations? Granted I don't have a=
 dvbt2 generator, but there may be one in the main office. When I set my dv=
bt generator up the rf output setting does not matter, both normal and inve=
rted work without issue when switching between for dvbt.
> > >
> > > Kind regards,
> > >
> > > Bradford
> > >
> > >
> > >
> > > On Tue, Jul 21, 2026, 12:30 Dimitris Kerasiotis <dkerasiotis@gmail.co=
m> wrote:
> > >>
> > >> Hi Hans, Brad,
> > >>
> > >> Thanks for looking at this.
> > >>
> > >> I can only confirm the behaviour on my own unit: Hauppauge model
> > >> 111519, rev G2I6 (USB ID 2040:b151), tuner reported as Si2157-A30.
> > >> With inversion =3D true it never locks on any DVB-T mux, briefly sho=
wing
> > >> FE_HAS_SIGNAL | FE_HAS_CARRIER but never FE_HAS_LOCK, even at -48 dB=
m
> > >> / ~33 dB C/N. With inversion =3D false it locks immediately and scan=
s
> > >> all 8 DVB-T muxes here in Athens, Greece cleanly (postBER 0). The sa=
me
> > >> unit works under the Windows driver.
> > >>
> > >> I don't have a second 935C to test other revisions, so I can't tell
> > >> whether this is universal or specific to this revision. I based the
> > >> change on the fact that the Evromedia Full Hybrid Full HD, which use=
s
> > >> the same cx231xx + si2168 + si2157 combination, already uses inversi=
on
> > >> =3D false.
> > >>
> > >> If it turns out to be revision-specific, I'm happy to respin the pat=
ch
> > >> to gate it on the eeprom model/revision instead =E2=80=94 just let m=
e know
> > >> what you'd prefer.
> > >>
> > >> Regards,
> > >> Dimitris
> > >> On Tue, Jul 21, 2026 at 8:14=E2=80=AFPM Dimitris Kerasiotis
> > >> <dkerasiotis@gmail.com> wrote:
> > >> >
> > >> > Hi Hans, Brad,
> > >> >
> > >> > Thanks for looking at this.
> > >> >
> > >> > I can only confirm the behaviour on my own unit: Hauppauge model 1=
11519, rev G2I6 (USB ID 2040:b151), tuner reported as Si2157-A30. With inve=
rsion =3D true it never locks on any DVB-T mux, briefly showing FE_HAS_SIGN=
AL | FE_HAS_CARRIER but never FE_HAS_LOCK, even at -48 dBm / ~33 dB C/N. Wi=
th inversion =3D false it locks immediately and scans all 8 DVB-T muxes her=
e in Athens, Greece cleanly (postBER 0). The same unit works under the Wind=
ows driver.
> > >> >
> > >> > I don't have a second 935C to test other revisions, so I can't tel=
l whether this is universal or specific to this revision. I based the chang=
e on the fact that the Evromedia Full Hybrid Full HD, which uses the same c=
x231xx + si2168 + si2157 combination, already uses inversion =3D false.
> > >> >
> > >> > If it turns out to be revision-specific, I'm happy to respin the p=
atch to gate it on the eeprom model/revision instead =E2=80=94 just let me =
know what you'd prefer.
> > >> >
> > >> > Regards,
> > >> > Dimitris
> > >> >
> > >> >
> > >> > On Thu, Jul 16, 2026 at 7:34=E2=80=AFAM Bradford Love <brad@nextdi=
mension.cc> wrote:
> > >> >>
> > >> >> Hi Hans et al,
> > >> >>
> > >> >> I'm out of town currently but can run tests Sunday. I have models=
 of every generation, so I can test for inversion changes. I will run dvbt =
tests and reply again.
> > >> >>
> > >> >> Regards,
> > >> >>
> > >> >> Bradford
> > >> >>
> > >> >>
> > >> >>
> > >> >>
> > >> >> On Wed, Jul 15, 2026, 06:18 Hans Verkuil <hverkuil+cisco@kernel.o=
rg> wrote:
> > >> >>>
> > >> >>> Brad,
> > >> >>>
> > >> >>> Can you review this patch? I'm not sure if this 'inversion =3D f=
alse' is valid for just
> > >> >>> one specific model, or if it is valid for all 935C models.
> > >> >>>
> > >> >>> I'm hoping you have some info about that, or are perhaps able to=
 test this with a
> > >> >>> 935C.
> > >> >>>
> > >> >>> Regards,
> > >> >>>
> > >> >>>         Hans
> > >> >>>
> > >> >>> On 09/07/2026 23:19, Dimitris Kerasiotis wrote:
> > >> >>> > On the Hauppauge WinTV-HVR-935C (USB ID 2040:b151) the si2157 =
tuner
> > >> >>> > is configured with inversion =3D true. On at least some hardwa=
re
> > >> >>> > revisions (tested: Hauppauge model 111519, rev G2I6) this is w=
rong:
> > >> >>> > tuner and demod probe successfully, firmware loads (si2157 pat=
ch
> > >> >>> > 3.0.5, si2168 B 4.0.25), signal strength is reported correctly=
 and
> > >> >>> > the Si2168 briefly reports FE_HAS_SIGNAL | FE_HAS_CARRIER, but=
 it
> > >> >>> > never achieves lock on any DVB-T mux, on any frequency, regard=
less
> > >> >>> > of signal quality (tested down to -48 dBm, C/N 38 dB). The sam=
e
> > >> >>> > unit works under the vendor's Windows driver.
> > >> >>> >
> > >> >>> > Setting inversion =3D false results in immediate lock (FE_HAS_=
LOCK,
> > >> >>> > postBER 0) and a successful scan of all eight DVB-T muxes rece=
ivable
> > >> >>> > in Attica, Greece. This matches the configuration already used=
 for
> > >> >>> > the Evromedia Full Hybrid Full HD, which uses the same
> > >> >>> > cx231xx + si2168 + si2157 chip combination.
> > >> >>> >
> > >> >>> > Tested on kernels 6.1 and 6.12 with identical results.
> > >> >>> >
> > >> >>> > Signed-off-by: Dimitris Kerasiotis <dkerasiotis@gmail.com>
> > >> >>> > ---
> > >> >>> >  drivers/media/usb/cx231xx/cx231xx-dvb.c | 2 +-
> > >> >>> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >> >>> >
> > >> >>> > diff --git a/drivers/media/usb/cx231xx/cx231xx-dvb.c b/drivers=
/media/usb/cx231xx/cx231xx-dvb.c
> > >> >>> > index 472a4405a..a5486bcca 100644
> > >> >>> > --- a/drivers/media/usb/cx231xx/cx231xx-dvb.c
> > >> >>> > +++ b/drivers/media/usb/cx231xx/cx231xx-dvb.c
> > >> >>> > @@ -1014,7 +1014,7 @@ static int dvb_init(struct cx231xx *dev)
> > >> >>> >               si2157_config.mdev =3D dev->media_dev;
> > >> >>> >  #endif
> > >> >>> >               si2157_config.if_port =3D 1;
> > >> >>> > -             si2157_config.inversion =3D true;
> > >> >>> > +             si2157_config.inversion =3D false;
> > >> >>> >
> > >> >>> >               /* perform probe/init/attach */
> > >> >>> >               client =3D dvb_module_probe("si2157", NULL, tune=
r_i2c,
> > >> >>>
