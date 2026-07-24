Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8B93FBB6F
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884273; cv=pass; b=ikRjn4ZxE2wVNoujMToFWG9flRv+IhLcoVw8unrAqnPnWwukzJDxroPcYfIqZGsIdhKg1eQCs2peyrpCnAcokP90w4nU+6Ka67bn6t2dkQ0xhz0i02ao7AUIYJeF+rrpJUKadmAmrV4A7jnMw9Ine6DeJyOb0TEDy8SVWDQ66g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884273; c=relaxed/simple;
	bh=s/GYdirJOAY0a5hGD7a2voIDZazK0t1i7eHV17jXKNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0OhDzBcOJlf/ZHGdSnx9nZNXG6knAp0Zdaod9/HJJBfZrt4u4mbe43KXMQy+YmwABUIvtoT/lwlKSrpoICMtj7LKWh0RvPRzNX8ovUlAx/uBtcYTTcpkrNyxTqykCzl/Eb7LOI6g0lzTE+C0uuH+Kcmg+OkchawQw5FQ43zf0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kreA++mJ; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kreA++mJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f707e5d75so169966f8f.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 02:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784884268; cv=none;
        d=google.com; s=arc-20260327;
        b=BFpXFqU54G9IZzxyF0XflNsJZaL4GD3gGezPWDe75s3S8k3dQbhoJ/gTiPM8bzDyo7
         0dZcmq1Rswp9LWXWTaUmU6Ly5/gOadFPzU4SANI1XObBG5nifiALuM+G+GKg5vZVe2KI
         lhfxWNp5MBAl4oXls3RplwazoVgp/7ASFGqO5mQRl6R+36eJMvxxHq36usMzPDCuCVLc
         Jq/bn5nGh0BEVfI6KIKrEh3/GdTT+rfGUYH/ogxcxyOzd/Q1ZtBXWbhrRdDnWykQlt/i
         tKcFURRgRXF0ZjiVhynNRMqn6+YobFirxTRtFJ+jbUjuwhi+zU3Xo+xE158cKYu9pvv8
         RAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gM7goXPRvc2VVZIvc9Z4S0ou953VSPKdH9g4lq7WY8A=;
        fh=JNTgIVflpiprWPS/9BrI1mX+Uo/TR9Tv9AcFqGRYQ5A=;
        b=fFeYkZOI7X8aIIrDkuF+ah+3X7fO83H9X00XDiPVh+Fl+ZkGQiNIJ2wIcvY0q1NAKi
         k4Qz9/zSbo1J8xcE9SXCiLCmAL2yvy7qTZ0L2y0VAGHQfInElJLSfyLTKMtfBKsMEXE/
         H125gD0O8mACt7obUJ99cnTkscs5pkYTbHTGedZmUz+Kf3Biu/n8nOFeO0fPprfgONIV
         SQMDCme8ALJ489h0dZkMPbstZdS7Y/wCW/jJBG36H3dWM9egbvNZYC9jR7946tG/6MC4
         jnBB6CTx0km8q51rLnuIXAolYll0qUZ15RhT+PeINRl4T6KoHwUOQ9VqNt+v1LlpKaGU
         4MCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784884268; x=1785489068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gM7goXPRvc2VVZIvc9Z4S0ou953VSPKdH9g4lq7WY8A=;
        b=kreA++mJTJz+3ay0QPeURS8J1wMFh84dcJNafZisVL20mL8+VZU4SZgb6k6augO6JD
         i9yjt2x2ybgZe2vXjDnqIjfz9Rh/tiwXVaHObMQ+OGAWHNCG2SDRBJxrQTIuKjghU3l4
         J4SXeycC+6h5qIQzeHgi1BOhEk6kE1kNbUiwS+a+kR6wZIUYRFNTYI23s1lLEk0c1s3M
         Pk9ouaNZbztoxtuXH6pnGumI4SZuBMxBzywdhq9rRqqiCfr+EO+yAaxH3x4fmKUFaTX2
         +Glf/JVuAZDlPK8JkmoN7PhKNfNih/dK7c3JPLyey/TbWrbS5n2LsH2rl1CzpJpfa0UJ
         ibFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884268; x=1785489068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gM7goXPRvc2VVZIvc9Z4S0ou953VSPKdH9g4lq7WY8A=;
        b=mlALKbX4GUNXiPA8kpCqNRpPOtHg0I21rWYnq4IGzsCvdJTWqPGzLdWnZzTAFx/0EZ
         D+l8LgcyXePLUil3SVb1IBv2l2uCYjWXMYN5cvbBttP6VezoIJitD45FiOFTxCY12OKF
         ejVPECJX38Fabot0woM58zqPJYjSI8q59pNIf0Fjpdwv0lyoG+JI4+0VkF3L3SUTKuBy
         6NMgTHsb5TuzmhKlbyEwD3Gmd7POT3/LidC1ubqJyqmhfiksTevC+fX1Sr81Fxjh+Qaa
         bsWAqrB1L6Y4VvGz2Jh/l0Pu2BBMgAHRwt21eFwtxkDsi/Onu6oFDug8aqOBssI99FND
         rprQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIOrHqEv8G3zb66tDFG47sH6ICFM0WnPumAONVbQcR9drnQDiYhq2jLvf+I2r9YG5u4v/U4XHOUQK+zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRfmImQ0GNUg0a5kK6bvHU49gA6B+axlz+0EP27ksLFlfKtAgG
	JkrlFVlJN3JeNbio600bgKcPh+HQkZ23V37ZqZJ3DmeHXp4ZrnCGUVuQzZG0+kDPvHf/pv7LBDk
	WFIZL6ToZaWhDBIi7aonE5r/qeTPmmoXH+Cz/Xx8=
X-Gm-Gg: AR+sD11NTTl0JBWbnYB8Mr4vKmq8ZYDW1+MlXDH6BMDsffHNat5sRqBfYrYieAtQAHI
	j9iLDWzEQUIEIe/iEC7pYykgQ4F+4xQNU9B9Y6tzqMgyYJkhbDFuDPX3HUQ7O3UAVP8f5glolJE
	h/z1b1gy7XWb90zuvPAgJ3hNZyCIBFy4agR0H4zY4mlXfzMN7llnDBtHSFpU76+dpeo1usBiQOR
	+ao35qPTEEai6J04E+xQidlj59SxT/vmA1Lk8hNdcY9xZMAQYRQh9gvkeM9
X-Received: by 2002:a05:6000:4012:b0:47f:941b:b438 with SMTP id
 ffacd0b85a97d-47f941bb441mr4250292f8f.27.1784884268197; Fri, 24 Jul 2026
 02:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709211918.958471-1-dkerasiotis@gmail.com>
 <471e276f-7ab8-4e49-bf1f-ae0f6b504a90@kernel.org> <CAA0YaJTjiAxXH4-A1yuUz_txAWnwmC=0Kt-p53Bb197Wm8C5mw@mail.gmail.com>
 <CADSHN4g-oRiqAVP8BHAU4d1cWjBHnNdnAj2f5wTSMx6uA59VcA@mail.gmail.com>
 <CADSHN4jM+1PT3PTTKkV0UTSHbm5xT56oSB3m5s_tccTnA0F3Hw@mail.gmail.com> <CAA0YaJSCMjKMkUneKDgNDuHLXbdLqYmsqNmP+enA=+R4QH9XiQ@mail.gmail.com>
In-Reply-To: <CAA0YaJSCMjKMkUneKDgNDuHLXbdLqYmsqNmP+enA=+R4QH9XiQ@mail.gmail.com>
From: Dimitris Kerasiotis <dkerasiotis@gmail.com>
Date: Fri, 24 Jul 2026 12:10:57 +0300
X-Gm-Features: AUfX_my8gbmTBHsSN0wGmophy3mVbUGEUUF67QRcfVOvFybCtxB-SzMjrkpQDxw
Message-ID: <CADSHN4itGxpyFyJ1+Pw5H9iSj1UwMBvhCKJMnr942qA_Nh_aCw@mail.gmail.com>
Subject: Re: [PATCH] media: cx231xx: fix si2157 inversion for Hauppauge WinTV-HVR-935C
To: Bradford Love <brad@nextdimension.cc>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bradford,

Thanks a lot for testing =E2=80=94 and for the 975 ATSC data point, that's =
very
useful.

Here are the exact parameters of the muxes I'm receiving (Athens, Greece,
Hymettus transmitter). All of them are plain DVB-T, no DVB-T2 in use here
for the main national muxes:

Bandwidth: 8 MHz
Constellation: 64-QAM
Transmission mode: 8K
Guard interval: 1/4
Hierarchy: none
Code rate (HP): 3/4 on the DIGEA muxes, 2/3 on the ERT muxes

Frequencies (all locked with inversion =3D false):
474 MHz (ERT) 482 MHz (DIGEA) 498 MHz (DIGEA)
522 MHz (DIGEA) 530 MHz (ERT) 546 MHz (DIGEA)
554 MHz (DIGEA) 578 MHz (DIGEA)

Signal on the strongest mux (522 MHz), rooftop antenna:
-48 dBm, C/N 33-38 dB, UCB 0, postBER 0, PER 0.

With inversion =3D true the same mux never gets past
FE_HAS_SIGNAL | FE_HAS_CARRIER (status 0x03) at that same signal level.

One thing that may be relevant to reproducing this: my unit's Si2168-B40
ships with ROM firmware B 4.0.2, and with that firmware the demod reports
0.00 dBm on every frequency =E2=80=94 no carrier detection at all. I had to=
 add
dvb-demod-si2168-b40-01.fw (which brings it to B 4.0.25) before I got any
signal readings at all. The inversion issue only became visible after
that. If your test units load a different demod firmware, that might
explain part of the difference.

On the 975 result: looking at the driver, the 975 attaches both lgdt3306a
and si2168 to a single si2157, so the inversion flag is shared between
the ATSC and DVB-T frontends. The 935C is si2168-only. It may be worth
noting that the only other si2168-only board in cx231xx-dvb.c, the
Evromedia Full Hybrid Full HD, already uses inversion =3D false, while the
lgdt3306a and si2165 boards all use true. That made me wonder whether the
correct value is really demod-dependent rather than board-dependent.

If that's the case, a question that would settle it: on your 975, does
DVB-T lock reliably with inversion =3D true? If DVB-T is also marginal
there, the 975 may need the flag set per frontend rather than per board.

Caveats on my side: I only have one unit (model 111519, rev G2I6) and I
have only tested DVB-T =E2=80=94 no DVB-C or DVB-T2 here to try.

I'm happy to run any test you'd like on this unit, or to respin the patch
in whatever form you and Hans prefer =E2=80=94 gated on the eeprom revision=
, or
reworked so the 975 keeps true for ATSC while si2168 gets false.

Kind regards,
Dimitris

On Fri, Jul 24, 2026 at 1:48=E2=80=AFAM Bradford Love <brad@nextdimension.c=
c> wrote:
>
> Hi Dimitris,
>
> I am testing this and investigating. I don't have a 935, but I have 955 a=
nd 975 of all revisions. The "family" consists of those three. Your finding=
 would affect both 935 and 975.
>
> I will confirm that your patch does break atsc when using dvbv5-scan on a=
 975, so while as is I imagine it's ok for 935's setup, there is something =
else going on. The device you're using has been in production a very long t=
ime, and you're the first to report such issue. It's just odd. I'm going to=
 talk with hardware lead about exact revision changes. I need to reach out =
to our European support as well to have them test.
>
> Can you by chance give me your exact parameters so I can set my generator=
 up as close as possible to your Greek stations? Granted I don't have a dvb=
t2 generator, but there may be one in the main office. When I set my dvbt g=
enerator up the rf output setting does not matter, both normal and inverted=
 work without issue when switching between for dvbt.
>
> Kind regards,
>
> Bradford
>
>
>
> On Tue, Jul 21, 2026, 12:30 Dimitris Kerasiotis <dkerasiotis@gmail.com> w=
rote:
>>
>> Hi Hans, Brad,
>>
>> Thanks for looking at this.
>>
>> I can only confirm the behaviour on my own unit: Hauppauge model
>> 111519, rev G2I6 (USB ID 2040:b151), tuner reported as Si2157-A30.
>> With inversion =3D true it never locks on any DVB-T mux, briefly showing
>> FE_HAS_SIGNAL | FE_HAS_CARRIER but never FE_HAS_LOCK, even at -48 dBm
>> / ~33 dB C/N. With inversion =3D false it locks immediately and scans
>> all 8 DVB-T muxes here in Athens, Greece cleanly (postBER 0). The same
>> unit works under the Windows driver.
>>
>> I don't have a second 935C to test other revisions, so I can't tell
>> whether this is universal or specific to this revision. I based the
>> change on the fact that the Evromedia Full Hybrid Full HD, which uses
>> the same cx231xx + si2168 + si2157 combination, already uses inversion
>> =3D false.
>>
>> If it turns out to be revision-specific, I'm happy to respin the patch
>> to gate it on the eeprom model/revision instead =E2=80=94 just let me kn=
ow
>> what you'd prefer.
>>
>> Regards,
>> Dimitris
>> On Tue, Jul 21, 2026 at 8:14=E2=80=AFPM Dimitris Kerasiotis
>> <dkerasiotis@gmail.com> wrote:
>> >
>> > Hi Hans, Brad,
>> >
>> > Thanks for looking at this.
>> >
>> > I can only confirm the behaviour on my own unit: Hauppauge model 11151=
9, rev G2I6 (USB ID 2040:b151), tuner reported as Si2157-A30. With inversio=
n =3D true it never locks on any DVB-T mux, briefly showing FE_HAS_SIGNAL |=
 FE_HAS_CARRIER but never FE_HAS_LOCK, even at -48 dBm / ~33 dB C/N. With i=
nversion =3D false it locks immediately and scans all 8 DVB-T muxes here in=
 Athens, Greece cleanly (postBER 0). The same unit works under the Windows =
driver.
>> >
>> > I don't have a second 935C to test other revisions, so I can't tell wh=
ether this is universal or specific to this revision. I based the change on=
 the fact that the Evromedia Full Hybrid Full HD, which uses the same cx231=
xx + si2168 + si2157 combination, already uses inversion =3D false.
>> >
>> > If it turns out to be revision-specific, I'm happy to respin the patch=
 to gate it on the eeprom model/revision instead =E2=80=94 just let me know=
 what you'd prefer.
>> >
>> > Regards,
>> > Dimitris
>> >
>> >
>> > On Thu, Jul 16, 2026 at 7:34=E2=80=AFAM Bradford Love <brad@nextdimens=
ion.cc> wrote:
>> >>
>> >> Hi Hans et al,
>> >>
>> >> I'm out of town currently but can run tests Sunday. I have models of =
every generation, so I can test for inversion changes. I will run dvbt test=
s and reply again.
>> >>
>> >> Regards,
>> >>
>> >> Bradford
>> >>
>> >>
>> >>
>> >>
>> >> On Wed, Jul 15, 2026, 06:18 Hans Verkuil <hverkuil+cisco@kernel.org> =
wrote:
>> >>>
>> >>> Brad,
>> >>>
>> >>> Can you review this patch? I'm not sure if this 'inversion =3D false=
' is valid for just
>> >>> one specific model, or if it is valid for all 935C models.
>> >>>
>> >>> I'm hoping you have some info about that, or are perhaps able to tes=
t this with a
>> >>> 935C.
>> >>>
>> >>> Regards,
>> >>>
>> >>>         Hans
>> >>>
>> >>> On 09/07/2026 23:19, Dimitris Kerasiotis wrote:
>> >>> > On the Hauppauge WinTV-HVR-935C (USB ID 2040:b151) the si2157 tune=
r
>> >>> > is configured with inversion =3D true. On at least some hardware
>> >>> > revisions (tested: Hauppauge model 111519, rev G2I6) this is wrong=
:
>> >>> > tuner and demod probe successfully, firmware loads (si2157 patch
>> >>> > 3.0.5, si2168 B 4.0.25), signal strength is reported correctly and
>> >>> > the Si2168 briefly reports FE_HAS_SIGNAL | FE_HAS_CARRIER, but it
>> >>> > never achieves lock on any DVB-T mux, on any frequency, regardless
>> >>> > of signal quality (tested down to -48 dBm, C/N 38 dB). The same
>> >>> > unit works under the vendor's Windows driver.
>> >>> >
>> >>> > Setting inversion =3D false results in immediate lock (FE_HAS_LOCK=
,
>> >>> > postBER 0) and a successful scan of all eight DVB-T muxes receivab=
le
>> >>> > in Attica, Greece. This matches the configuration already used for
>> >>> > the Evromedia Full Hybrid Full HD, which uses the same
>> >>> > cx231xx + si2168 + si2157 chip combination.
>> >>> >
>> >>> > Tested on kernels 6.1 and 6.12 with identical results.
>> >>> >
>> >>> > Signed-off-by: Dimitris Kerasiotis <dkerasiotis@gmail.com>
>> >>> > ---
>> >>> >  drivers/media/usb/cx231xx/cx231xx-dvb.c | 2 +-
>> >>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>> >
>> >>> > diff --git a/drivers/media/usb/cx231xx/cx231xx-dvb.c b/drivers/med=
ia/usb/cx231xx/cx231xx-dvb.c
>> >>> > index 472a4405a..a5486bcca 100644
>> >>> > --- a/drivers/media/usb/cx231xx/cx231xx-dvb.c
>> >>> > +++ b/drivers/media/usb/cx231xx/cx231xx-dvb.c
>> >>> > @@ -1014,7 +1014,7 @@ static int dvb_init(struct cx231xx *dev)
>> >>> >               si2157_config.mdev =3D dev->media_dev;
>> >>> >  #endif
>> >>> >               si2157_config.if_port =3D 1;
>> >>> > -             si2157_config.inversion =3D true;
>> >>> > +             si2157_config.inversion =3D false;
>> >>> >
>> >>> >               /* perform probe/init/attach */
>> >>> >               client =3D dvb_module_probe("si2157", NULL, tuner_i2=
c,
>> >>>
