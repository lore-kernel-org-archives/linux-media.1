Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFBE3C140F
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363009; cv=none; b=ShpyPGtQrjPIIShQ9ezZeNFxzACXBVAhoFOLlLSkU4QyYFViq5nlJ4i42xobVkv2xZ1rfHP6igSgcK1YNrvOAqR63qiX/tlEN3Grf5wkedTNDANUKAcHCRFxuCvPbSsLqWbG3etFOcjR1awqRAUUZq3Atx+YDNAcFbnxFH/oUvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363009; c=relaxed/simple;
	bh=KRfJIiPa51V1djniqs2J+yGnjkzHnnLfa0Qqm8HPfYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=aPElYs0h8c8FaZVJA+aKPna+gvFOOQ+c9Vmum9vHms0C7FeBNnDoa26i54HyQDc8gxPh+kmAKFU3NsP4NMI0keMn/iimemjuHGPAFb8uhWrSJ17HPTU9D4FTwbX9qbM8o27w6AOUYbNl4feDd2vpEWO+7ghMQc/ztjGa9msIQuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lxg+5bn6; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lxg+5bn6"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso2192927a12.0
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786363006; x=1786967806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRfJIiPa51V1djniqs2J+yGnjkzHnnLfa0Qqm8HPfYw=;
        b=Lxg+5bn6Kv/YW1HOLXZMz/BEz6f6RQ8BQi18PPUq50968au5qalK56dSfqvuiAc4Ro
         sKnvf/pvwR8HS4hhARoFhmf0Pf6Wfzn+IK4l9gW2OKQmQFN3QCpomRRt8psxi1wFjt2H
         g1LD28dQkXQTiFxAhGsrTpUthBM5wQC5gfqC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786363006; x=1786967806;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KRfJIiPa51V1djniqs2J+yGnjkzHnnLfa0Qqm8HPfYw=;
        b=eFxUspDpenKOGCZPedjF0eQjAHIJkuWwaq1TRbaeEQBmg0se3z6CQAd6fY+wR2sYpH
         u9uiP0mk4FC+fB42a8HkxPjOgPHUPonAfCKv469XGgj8xdkNDPBO9wu9n385C0nTwP1u
         CoUe6lbyG/1UlIxCZcfR/xX6QUuYkeLv6W2DAFJdpULps88akDZWoC25FoEO2pr/va9d
         +2/KH0li6tr9pDv2yN3zxvfBfFs767Igy4Ze8eXVdxhLuvT3Gn/0B5fQxTs4yT2FuECy
         lHLhqBN+UHbOJmStN08Uw2cYPYUR84HUzsRBs4f7duqaih8lr4ZvVKQ8WfBOcVVVOyWl
         t6Vw==
X-Forwarded-Encrypted: i=1; AHgh+RrXDUnqVg6eh1bDhFacxzC56OeW6qUwF8cf7ABrGVLWA49RyaXn8n8s3u17c2bGWLKEXC4kmw0MMNo0Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ClRDeiaip0bQE/P4CFHIr3aQ/yVfq7jo7vfctwKqK+ydZlWh
	/1vMpWoTGakpaNGGMOrveR/Y4wrKlnA1fK/5JFBzLXUpmXxc1mORvMHcqkgT1zs0954MWp13YP4
	nltubjQ==
X-Gm-Gg: AR+sD10wkxtD5TNoH57GxF4EX9W05bfTa2IZasTFIb1dv7832V1leRo0eV+LqbMirNm
	nkAYBWjaQTHJ/abKnUsXgF9LMbwynN6Oo+8U8auUN/NydlaZd1En8vn4cSZ3Y58KfkEqB2TUPBI
	7UoSHunFK1d4SMI1Xymjp2rFMyQpaaOLPnyDWHb/KIeYwp49eoOwU0XBsvh5nmkwV47i3AQsg35
	saYozfAEu4zmQJcFCldKygcfOcioTd2nXIQeMIe2CGFoNPDoobIsyTFC3ZOOfz4bYBWe/HgmVPo
	w4dBE+n4ZcQCSkN2BjtVY8M4ll+0U5ZXKIdjENITECe1oGNkWV2ie4W0xBuNAuktY/vB3hAhu09
	hUv5eJFovBhLMJ1jw+DVP1F9IiwTZlTHzVyR9JyJ4iXVCaSBw3MBTYGvs5kxAEyXalbxUR3Oa4w
	nbJW8Use2wbvrgynR5vQ3AwxZb+w5f4rPdobrkH07nOiQIxXNQfndyVosLmfsLXjNRwijAftUxN
	CvBsAD6D2zjdIwu6Qx0clQL0KboI7LeQ70sbg==
X-Received: by 2002:a05:6402:24db:b0:6a1:feb6:6d78 with SMTP id 4fb4d7f45d1cf-6a1feb6806amr5417996a12.18.1786363006086;
        Mon, 10 Aug 2026 04:56:46 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1e7c0de5csm3958505a12.0.2026.08.10.04.56.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 04:56:44 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1fbe461f59so223897966b.2
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 04:56:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrfFfFPuxD7ITBNuLlxTPsQfjb1XcuNmA5CLEKiCb/peG2GMxFne0jbaJxllvSDmokUk2o4B/tNxo6y8g==@vger.kernel.org
X-Received: by 2002:a17:906:ef02:b0:c1c:332b:74a1 with SMTP id
 a640c23a62f3a-c20733ef517mr1445207466b.28.1786363003498; Mon, 10 Aug 2026
 04:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABGBkYsZckKwJqcjaQrRvhsmRQ2faST9h0zbPEk9xaCVyXPJ7g@mail.gmail.com>
 <CANiDSCvVJ7tTA91rV5S502sL-Ao+KH5x5SvUCn401PYj+PqwyQ@mail.gmail.com>
 <CABGBkYv7m35cd_sGdufbv-eBj663dP2NAzpwh1x4h=bwufBwgg@mail.gmail.com>
 <CABGBkYsu9FRPAgnXis-YLhJJafp0CziJB2v=t=utMnJHaKE_Wg@mail.gmail.com>
 <CANiDSCsTKnqyKZvOHGx3Jcpsmqb1VugXGBr_P7yq_ZP1ra88eg@mail.gmail.com> <CABGBkYveKjm8Q9zbVxaWCVEK-R2zGScH1xmeMhB+b9771t2dLQ@mail.gmail.com>
In-Reply-To: <CABGBkYveKjm8Q9zbVxaWCVEK-R2zGScH1xmeMhB+b9771t2dLQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 10 Aug 2026 13:56:29 +0200
X-Gmail-Original-Message-ID: <CANiDSCvt4f=NYCV3Y0eD=mKNkKknKv1WUz0gXcWBcrM6sW4Htw@mail.gmail.com>
X-Gm-Features: AUfX_mywMrvYyyl3SApBIZ-jTZwKf_nTH9VekPZbUOo6M27vFaG71L_deXDfpKk
Message-ID: <CANiDSCvt4f=NYCV3Y0eD=mKNkKknKv1WUz0gXcWBcrM6sW4Htw@mail.gmail.com>
Subject: Re: usb webcam: infinite reset/resume bug
To: Flynn <flynnwilson772@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Flynn

Just to understand what is going on:

OBS with pipewire+v4l2 plugins -> fails
OBS with v4l2 plugin -> works
OBS with pipewire plugin -> works

?

On Sun, 9 Aug 2026 at 03:50, Flynn <flynnwilson772@gmail.com> wrote:
>
> Hi, sorry for the late reply.
>
> I could have sworn I removed it, but when I went to check the camera situ=
ation today I realized I had a Pipewire beta camera input in my OBS in addi=
tion to the V4L2 one. The Pipewire one seems to work even when the V4L2 one=
 is fucked, and removing the Pipewire one seems to fix the V4L2 one. I real=
ly don't know how I missed this for so long. So after that discovery everyt=
hing seems to work fine but I'll update you if it breaks again. Thanks for =
your patience
>
> Regards,
> Flynn
>
> On Fri, Jul 31, 2026 at 1:43=E2=80=AFAM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
>>
>> Hi Flynn
>>
>>
>> On Sat, 25 Jul 2026 at 00:54, Flynn <flynnwilson772@gmail.com> wrote:
>> >
>> > Just thought I should note I was just on a Discord call using this sam=
e camera and it worked fine with no issues.
>>
>> Looks like the camera is marking frames as erroneous after you change
>> the control:
>>
>> [674830.694385] uvcvideo 1-4.3.2:1.0: Control 1/4 value change len 9
>> [674830.710385] uvcvideo 1-4.3.2:1.0: Control 2/10 value change len 7
>> [674830.725403] uvcvideo 1-4.3.2:1.0: Marking buffer as bad (error bit s=
et)
>> [674830.725408] uvcvideo 1-4.3.2:1.0: Marking buffer as bad (error bit s=
et)
>> [674830.725410] uvcvideo 1-4.3.2:1.0: Marking buffer as bad (error bit s=
et)
>> [674830.725411] uvcvideo 1-4.3.2:1.0: Marking buffer as bad (error bit s=
et)
>> [674830.725412] uvcvideo 1-4.3.2:1.0: Marking buffer as bad (error bit s=
et)
>> [674830.725413] uvcvideo 1-4.3.2:1.0: Marking buffer as bad (error bit s=
et)
>>
>>
>> So we have to debug two different things:
>>
>> - Is the error bit confusing OBS?
>>
>> You can check if that is the case by
>> rmmod uvcvideo
>> modprobe uvcvideo trace=3D0xffffffff nodrop=3D0
>> CRASH YOUR CAMERA
>> dmesg > dmesg.log
>>
>> If that works, then we need ping the obs studio guys.
>>
>>
>> - Is your camera unable to recover? (is it broken?)
>>
>> If the previous test do not work. We should probably ask Logitech what
>> is going on.
>>
>>
>> But lets go step by step and check the nodrop test.
>> Regards!
>> >
>> > On Fri, Jul 24, 2026 at 2:52=E2=80=AFPM Flynn <flynnwilson772@gmail.co=
m> wrote:
>> >>
>> >> Hi Ricardo, I only managed to get any output from the second test (th=
e first one printed nothing at all to dmesg). I've attached it as dmesg.txt=
.
>> >>
>> >> You'll note there are two different devices doing stuff in the log. O=
ne is my laptop's inbuilt webcam and the other is the USB webcam I'm primar=
ily troubleshooting (which I bought so I had a camera to move around). Afte=
r realizing they were both using the same driver, I did another test that w=
ent like this:
>> >> - opened OBS to see USB camera input currently broken
>> >> - opened camera input properties, upon which it fixed itself
>> >> - switched to my inbuilt webcam (causing it to freeze again on a fram=
e of the USB webcam)
>> >> - switched back to the usb webcam (it did not recover from the freeze=
)
>> >> I've attached that log as dmesg3.txt, though I sure don't recognize a=
ny of the specific events in it. Pretty sure the USB webcam is on 1-4 or wh=
atever and the inbuilt is 1-13. Thanks for the help
>> >>
>> >> Regards,
>> >> Flynn
>> >>
>> >> On Fri, Jul 24, 2026 at 12:17=E2=80=AFAM Ricardo Ribalda <ribalda@chr=
omium.org> wrote:
>> >>>
>> >>> Hi Flynn
>> >>>
>> >>> Is the error reproducible? If so, could you share the output of dmes=
g
>> >>> after the camera freezes?
>> >>>
>> >>> Also, try this:
>> >>>
>> >>> dmesg -c
>> >>> rmmod uvcvideo
>> >>> modprobe uvcvideo trace=3D0xffffffff
>> >>> CRASH YOUR CAMERA
>> >>> dmesg > dmesg.log
>> >>>
>> >>> And then share the dmesg, hopefully it has enough information for us
>> >>> to figure out what is going on
>> >>>
>> >>>
>> >>> On Fri, 24 Jul 2026 at 02:18, Flynn <flynnwilson772@gmail.com> wrote=
:
>> >>> >
>> >>> > Hello mailing list, please go easy on me as I've never reported a =
bug this way before.
>> >>> >
>> >>> > So I have a Logitech USB webcam using uvcvideo and v4l2, and I'm t=
rying to use it with OBS Studio (the Flatpak if it matters). However, upon =
changing the device's video settings (possibly to an impossible/unsupported=
 combination? i did try to increase the exposure AND set the framerate to m=
ax?), the video stream froze fully and as far as I can tell didn't recover =
until I manually replugged it. (Frankly I don't have the patience today to =
check what makes it start working again, lol)
>> >>> >
>> >>> > Expected behavior is that the device should either not fail in the=
 first place, or should recover the first time it tries to.
>> >>> >
>> >>> > Kernel: Linux pop-os 7.0.9-76070009-generic #202605191504~17804318=
19~24.04~94774ef SMP PREEMPT_DYNAMIC Wed J x86_64 x86_64 x86_64 GNU/Linux
>> >>> > Distro: Pop OS 24.04 LTS
>> >>> >
>> >>> > UVCVideo quirks: 4294967295
>> >>> > modinfo uvcvideo | head -20 attached as uvcvideo.txt
>> >>> > lsusb -v -d 046d:0825 attached as webcam_info.txt
>> >>> > v4l2-ctl --device=3D/dev/video3 --all attached as capabilities.txt
>> >>> > v4l2-ctl --device=3D/dev/video3 --list-formats-ext attached as for=
mats.txt
>> >>> > the full OBS run log is attached as obs_log.txt
>> >>> >
>> >>> > I'm ready and willing to provide further info, do more diagnostics=
 or run test patches if it would help. Thank you
>> >>> >
>> >>> > Regards,
>> >>> > Flynn
>> >>> >
>> >>> >
>> >>>
>> >>>
>> >>> --
>> >>> Ricardo Ribalda
>>
>>
>>
>> --
>> Ricardo Ribalda



--=20
Ricardo Ribalda
