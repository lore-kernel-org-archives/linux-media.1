Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA70406270
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655014; cv=pass; b=GlFAxR4iweIbWc9BRqne/oWC6w37cwVnqUMClQsDfEq3+mIGN8aw+fNehckzqmFVVZSNLXNCCZlZSvwEOZST2+tatCj7lMqvq2g36xVzm91HpPPxXUlCqaZs9PaSYFSCLt9sgPdWez/rmn9C/k+Y5VLI0nRM4KIXJTj1qAvFeXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655014; c=relaxed/simple;
	bh=SS8WO1bDWADpbsCFHdV3IZuwYU603zs1dK0e2yTHC3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYTnsBEzFEMKqLgG3KFTiTwDuPUJdnqbgmNpFBAh+A5SOOJ9DgSjTVViR9IosH0ns2Zkbd1Vo6rvHkG+RvOAljvuwm0Ytxb1lMj5YqkCe0xhbrMPw1sw5Q8duQGkh1a3DOyjTJJZgOpNLRBRvxUbXeAOwSOvyKm28NiEcT9ausM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIFors2L; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIFors2L"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4728c12ba97so5952918f8f.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 10:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784655010; cv=none;
        d=google.com; s=arc-20260327;
        b=gDwM0JnTa0CnVWaEXBpP4P/eGOSy1mCRQvfzcr3OyNsn7Q58JKLR+jd5T5GtKoagRN
         bl4YfiPcE5M7wPmfYk5v0IjhayKyyZs9zlJ3eTVhQShWbVIWQaqMj00jbpxN+DKIcO9E
         zG9ciaRh9u8Sv8xmpH3bxdQ1MjQ+XCuYmSdTFyzIWWwGDENdLHxR0t2CXoOaeDCv9vnE
         7Zpdut4nDd2zmYGme5T0lrDkW/Oyk9YcyWhWIFa0GOd0jqjRzcyqx5GpdOzj0wkVvd+m
         aHTuMdOoERY28rNbM4K/vgHNXgZrRJnjhsLIwdfkmGXmwUhrBNW8GAytjy7H+GYbWok3
         oPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VkWhafnRMCrN20hU8NCwfUKQapv+xQWpcbUGZVqtAHU=;
        fh=h2Id44lgZAhZIBMuD7bEw23KMZCE0n+tNLZ5UDet8bk=;
        b=fklbpArsxrZIN8nXAyW+UJO4hp4R6ECI/NUv3oHZgqm5Xqft15KxRWZ7GxT49tOCdE
         VfRK2pdDKT8POHMhmoe41FGgi26vKZUbnQOsxOBud4IASWcFdMnlEwaCUPGtlRmObJVo
         WNvrT+hHz0zfyxftFXgXf9BgggecWtqBCGaz81Qx0tzeKpmnLeR5YNDOPu9fW4ABpqnT
         FciTeAIP+ywEbjBM1jptF4sZWDnKndJx732c/kxsBaLCKUg2W1zeRTSxyzPGIHA+alxg
         GJxODOwNY4HMmKHSZ09AlF6ccl9Wnpinsl6CTRclCEoVhOpOoTnOffD1SOvfqZYnLbtI
         f3/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784655010; x=1785259810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VkWhafnRMCrN20hU8NCwfUKQapv+xQWpcbUGZVqtAHU=;
        b=lIFors2LEfAndx2qMW5zdGw04aRC6o6EnCZb2iUPR0tuyBjRjdsNaDns9wFCQZq94i
         qjRu3WlmGr4jmhZ/MegFKz089Up9NfNVSPt97mZmkrFMaFxjdzoszZnTBHSjQlX+YwOA
         BNminyIniep2KpBZrM1KtffNQrGUFF97jXBsM2pQYypwb0Kk0JmWBCrFowGvo4n8IajB
         CWjaBI6BUrubBBCYosNbSl1TtZFIbhPU/bz9yMY5d7WnpnSe0FKyDgLR936MGKYdNDXb
         6yQwFhPbPAQ+qe39mYsTO2lKjhfnHXUdFSP93HFNQlus1JMVfeSAMk4XR3Z/l96AS5MH
         WEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655010; x=1785259810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkWhafnRMCrN20hU8NCwfUKQapv+xQWpcbUGZVqtAHU=;
        b=IhmjwSbrqPCQeUeXLoqcXQrLoYTf5U3G0JogQUJ8/opKjZ8ewO+pO5CKTen6G4UbBB
         vsWPBkqQY2mQmBgWhrTVhvls0h7u7aaGRJ0yDNHXK0xpALIQJeHVzHeB0KhR8+aKNjr3
         SFRnH83wTcpHfC4dUsC3Mt4WGYn0wRqx2tQlWg7sNxwM+nwMJ4XuIeRdHNjmtksGhae5
         ZG1znfy7lXGvwB+0kKEvtYKzC1UcaYrsPTPnqiDX5ij9/iRW5EPfZ0CKlZVdaGgpr/19
         cMh2+iv3aYG+lNouMijGIoBQxUay+KA0dcNd53aS86oUPCE5xOJJwh/pL+FfsEZ1cOtB
         FhVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOEKlAlEiXwYmwPqDeO16HEuBqWo57BBhfk7JTCRHWP0YoCIc6hAL8T5zJ6GPfUeF03JwRaxDbj3a5sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPcUPb5U9mvq6/C/wrk2Ie/3OxeDhKGWS2R8PXGR8p4WBGaFM
	Wqvt6EqIeW4tDOavK4wGSo9xswjmyR3EH2LQ28DlqLxcR5IEBLgZ5J4vDBV676Txrfv7LeEbfMb
	KdYxmP2/71wRRXXGNfLGMieKpmL0mRU4=
X-Gm-Gg: AR+sD10DrgOkycP1DO2XMmZzf7/4pj2BO+NMJ2WyCa5HSV85wbpF5HNTjHMLS/OxuOe
	Rqm42kHJxp+ozIegnFnMpbXDbpK5LCVmtNdJyEb45jSkMw9Yh6jsdwJwi/ul8jTHaqoGnLnK9i5
	j5V3FkSLpN6QA+sL5WCHn+Rjr863Xo2JqS7VWTuuiyJXf848tQMjfhv4gaPXbY4GQsHvt3jQU2U
	d5irHQwjAwi4Tawx4uU9tN+9pJ4EKh/Lz3fW/pVJK2K63Y1oe8JhrxGGVXZAjoH/B8OIOICGg==
X-Received: by 2002:a05:6000:4914:b0:47f:6e23:64d6 with SMTP id
 ffacd0b85a97d-47f6e2366f5mr15548225f8f.16.1784655010241; Tue, 21 Jul 2026
 10:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709211918.958471-1-dkerasiotis@gmail.com>
 <471e276f-7ab8-4e49-bf1f-ae0f6b504a90@kernel.org> <CAA0YaJTjiAxXH4-A1yuUz_txAWnwmC=0Kt-p53Bb197Wm8C5mw@mail.gmail.com>
 <CADSHN4g-oRiqAVP8BHAU4d1cWjBHnNdnAj2f5wTSMx6uA59VcA@mail.gmail.com>
In-Reply-To: <CADSHN4g-oRiqAVP8BHAU4d1cWjBHnNdnAj2f5wTSMx6uA59VcA@mail.gmail.com>
From: Dimitris Kerasiotis <dkerasiotis@gmail.com>
Date: Tue, 21 Jul 2026 20:29:57 +0300
X-Gm-Features: AUfX_mzWGXlp8KvEdNB6lFbZBablLLxxk07SmzF6FWZ8ou2cr6Rq154AueV1x3s
Message-ID: <CADSHN4jM+1PT3PTTKkV0UTSHbm5xT56oSB3m5s_tccTnA0F3Hw@mail.gmail.com>
Subject: Re: [PATCH] media: cx231xx: fix si2157 inversion for Hauppauge WinTV-HVR-935C
To: Bradford Love <brad@nextdimension.cc>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans, Brad,

Thanks for looking at this.

I can only confirm the behaviour on my own unit: Hauppauge model
111519, rev G2I6 (USB ID 2040:b151), tuner reported as Si2157-A30.
With inversion =3D true it never locks on any DVB-T mux, briefly showing
FE_HAS_SIGNAL | FE_HAS_CARRIER but never FE_HAS_LOCK, even at -48 dBm
/ ~33 dB C/N. With inversion =3D false it locks immediately and scans
all 8 DVB-T muxes here in Athens, Greece cleanly (postBER 0). The same
unit works under the Windows driver.

I don't have a second 935C to test other revisions, so I can't tell
whether this is universal or specific to this revision. I based the
change on the fact that the Evromedia Full Hybrid Full HD, which uses
the same cx231xx + si2168 + si2157 combination, already uses inversion
=3D false.

If it turns out to be revision-specific, I'm happy to respin the patch
to gate it on the eeprom model/revision instead =E2=80=94 just let me know
what you'd prefer.

Regards,
Dimitris
On Tue, Jul 21, 2026 at 8:14=E2=80=AFPM Dimitris Kerasiotis
<dkerasiotis@gmail.com> wrote:
>
> Hi Hans, Brad,
>
> Thanks for looking at this.
>
> I can only confirm the behaviour on my own unit: Hauppauge model 111519, =
rev G2I6 (USB ID 2040:b151), tuner reported as Si2157-A30. With inversion =
=3D true it never locks on any DVB-T mux, briefly showing FE_HAS_SIGNAL | F=
E_HAS_CARRIER but never FE_HAS_LOCK, even at -48 dBm / ~33 dB C/N. With inv=
ersion =3D false it locks immediately and scans all 8 DVB-T muxes here in A=
thens, Greece cleanly (postBER 0). The same unit works under the Windows dr=
iver.
>
> I don't have a second 935C to test other revisions, so I can't tell wheth=
er this is universal or specific to this revision. I based the change on th=
e fact that the Evromedia Full Hybrid Full HD, which uses the same cx231xx =
+ si2168 + si2157 combination, already uses inversion =3D false.
>
> If it turns out to be revision-specific, I'm happy to respin the patch to=
 gate it on the eeprom model/revision instead =E2=80=94 just let me know wh=
at you'd prefer.
>
> Regards,
> Dimitris
>
>
> On Thu, Jul 16, 2026 at 7:34=E2=80=AFAM Bradford Love <brad@nextdimension=
.cc> wrote:
>>
>> Hi Hans et al,
>>
>> I'm out of town currently but can run tests Sunday. I have models of eve=
ry generation, so I can test for inversion changes. I will run dvbt tests a=
nd reply again.
>>
>> Regards,
>>
>> Bradford
>>
>>
>>
>>
>> On Wed, Jul 15, 2026, 06:18 Hans Verkuil <hverkuil+cisco@kernel.org> wro=
te:
>>>
>>> Brad,
>>>
>>> Can you review this patch? I'm not sure if this 'inversion =3D false' i=
s valid for just
>>> one specific model, or if it is valid for all 935C models.
>>>
>>> I'm hoping you have some info about that, or are perhaps able to test t=
his with a
>>> 935C.
>>>
>>> Regards,
>>>
>>>         Hans
>>>
>>> On 09/07/2026 23:19, Dimitris Kerasiotis wrote:
>>> > On the Hauppauge WinTV-HVR-935C (USB ID 2040:b151) the si2157 tuner
>>> > is configured with inversion =3D true. On at least some hardware
>>> > revisions (tested: Hauppauge model 111519, rev G2I6) this is wrong:
>>> > tuner and demod probe successfully, firmware loads (si2157 patch
>>> > 3.0.5, si2168 B 4.0.25), signal strength is reported correctly and
>>> > the Si2168 briefly reports FE_HAS_SIGNAL | FE_HAS_CARRIER, but it
>>> > never achieves lock on any DVB-T mux, on any frequency, regardless
>>> > of signal quality (tested down to -48 dBm, C/N 38 dB). The same
>>> > unit works under the vendor's Windows driver.
>>> >
>>> > Setting inversion =3D false results in immediate lock (FE_HAS_LOCK,
>>> > postBER 0) and a successful scan of all eight DVB-T muxes receivable
>>> > in Attica, Greece. This matches the configuration already used for
>>> > the Evromedia Full Hybrid Full HD, which uses the same
>>> > cx231xx + si2168 + si2157 chip combination.
>>> >
>>> > Tested on kernels 6.1 and 6.12 with identical results.
>>> >
>>> > Signed-off-by: Dimitris Kerasiotis <dkerasiotis@gmail.com>
>>> > ---
>>> >  drivers/media/usb/cx231xx/cx231xx-dvb.c | 2 +-
>>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>>> >
>>> > diff --git a/drivers/media/usb/cx231xx/cx231xx-dvb.c b/drivers/media/=
usb/cx231xx/cx231xx-dvb.c
>>> > index 472a4405a..a5486bcca 100644
>>> > --- a/drivers/media/usb/cx231xx/cx231xx-dvb.c
>>> > +++ b/drivers/media/usb/cx231xx/cx231xx-dvb.c
>>> > @@ -1014,7 +1014,7 @@ static int dvb_init(struct cx231xx *dev)
>>> >               si2157_config.mdev =3D dev->media_dev;
>>> >  #endif
>>> >               si2157_config.if_port =3D 1;
>>> > -             si2157_config.inversion =3D true;
>>> > +             si2157_config.inversion =3D false;
>>> >
>>> >               /* perform probe/init/attach */
>>> >               client =3D dvb_module_probe("si2157", NULL, tuner_i2c,
>>>
