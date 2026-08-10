Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FAD35C69B
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786350464; cv=none; b=BUSg9hmUnnMdLe26oZMRbLYoxyssLVw+fthhqQXDv4VnQP4I0ncU6LZnCsIcO91vS064O88dmwr96fX7wcdi3WTyx/BoqrCXIBgo3Hxv7dhRsBhUPCCVzRQrKvfKA6IUh7L2ns41jn27vT6Mxd0Z7LjFAqFGQnoZ27JGkUMKMqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786350464; c=relaxed/simple;
	bh=C6+gTntsglzccp1EpzaUMeqLxrfJcUlgQtDoLbk6myY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=px4nkitazmWHxTe4AlPBYR9L8ru77hma4yQFXMR6Ol5HmUcJDKoR4H3DacqPbqpU5NjUJZMf4GP6L/jOGdyyLb4VXAu2aJz9MPtfvtVMs64N1e4xNXhRlasVf295ICfPOW6H9kmnNOkS8JavKeoZiV5mszM/WetNh91nVy2alhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YEE3aKv2; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YEE3aKv2"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2055573c8cso195075666b.3
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 01:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786350460; x=1786955260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6+gTntsglzccp1EpzaUMeqLxrfJcUlgQtDoLbk6myY=;
        b=YEE3aKv2tn59mCj95mS4m/uvCzNjO7kJVMrEB8roNtfDfvkr4pVIK4+oeWdBUjKw+/
         11fumNTPjJPHiWR77Ml/r6ZjPHVsDbt6aqTi2NdkRsNjPxs/VJlmeW/5r+5EdMoCxrJm
         H4zgckbtelKVbC3JbA0yhZbNJqteRRY5rXViA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786350460; x=1786955260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6+gTntsglzccp1EpzaUMeqLxrfJcUlgQtDoLbk6myY=;
        b=kKGFL5JhhQkgjGEcPCEWnkRKayHh1rmF8+Fex4LngchxL1HYsx9R1N/9v0p6ZzJup/
         VhmWuL8NEOQw2yS/uBbLzFxU0unHwhSoS0uOoJoj/g7KSberOdoKSvLpCVCcEbH2mqOH
         x/K9Ze/mb0U6srroYHdPpCMMZ2hUKm8OhPQRUEhJYlnZkPgFddRlUR//oC9eho2uWGsn
         UU6ECR/7suDezWYlgbyNUZ/GyUhl0rBdBrrciKo4n50ZeIef7O7xG1+z+hikQp6y+Egv
         /PxzgNS89VnSnsXCwlknN4Y4vipoP1p+m3i82l45cwQXjwWzFCiYauUSL+EDY3qny/0g
         C/OA==
X-Forwarded-Encrypted: i=1; AHgh+RqN9kbbKq+66jDmBwNUVi/HDzEKO6WO5fTR0aloZewihe8CHiVcHX5qxzRfboNPjJKH6MaGcs8hbtJx1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx1rTqQhD49HmI6Pz7CKHgQFt8NARGzltmGy/er2WNsVaYQkvu
	6tr3HfYbolhyL4ICH8g+Qsiv1OCL/4ThZByeCGseWopVewpMGA+U/XVDEPUcHcX7qNYm0FjhqSV
	NbKY=
X-Gm-Gg: AR+sD10/QTZgs3Lf93+zWAcrYTSHzxJm64oEA7I+XHhKDapi5rGlILxiKO9FGVWXcE4
	46DW2c1aqXCidYdSwlPn9fpSDrbBT41r8gjd7CcUDF+vsaxT15xscXdVbwBkRNMzasTVPpA6ndJ
	urmkx6oRPGYAx6ejvIBLDkVN0o/EieDGGK4STXYGEPOIptT1mlh4BQj/z/8CiU4ah1AOPwVi4IF
	UMWJDySEd+PuMCBvpiIGFk7QQtOP4SPoaRbBi1+TEAUY4qP+swSLkVZSKNGoY0LvHMqr3NZkfJ/
	pVJPJdEpP95WHSkP/nGmCZzYKpAf38P7MjRzqbYnntnKH1StLbhOfs2AAaW/kJwbV1JOss/E+ki
	tzsT+aKPEaO3vVVlmyHBCvdvtzZSQwGi4aA7gClxP1uQfw3As4ox3miY5fWf5+D9ujlbTLC1T2U
	4ypXIwqEX/7Ya8ohfcwLmWGnjSAGyoiJwkAd3vcahkGUtm5sRibPHgiRNFcqLxw65IwY7vyQGBZ
	ur2lsfcL0YJcIf7isAXo1SC5VHYporQiy/f
X-Received: by 2002:a17:907:3ccb:b0:c1b:1315:163e with SMTP id a640c23a62f3a-c2039d6f9eamr1843197566b.29.1786350460602;
        Mon, 10 Aug 2026 01:27:40 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1f7caeda4sm2848421a12.25.2026.08.10.01.27.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 01:27:39 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so2340811a12.0
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 01:27:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoHYg9lMZ9+BOvVUT2CL4+EbqIhvUvsVV2COpdoDIFLfLvURiBcxhk/fDlIQdTbP6th82BZ4u+6cfvY3Q==@vger.kernel.org
X-Received: by 2002:a17:907:3ccb:b0:c1b:1315:163e with SMTP id
 a640c23a62f3a-c2039d6f9eamr1843187866b.29.1786350458137; Mon, 10 Aug 2026
 01:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCvhLt7kWn1bfz_h2Tw+SMs7AsLM-pFyhADZh2-Aor=gxA@mail.gmail.com>
 <20260806094500.4729-1-reza1234khan1234@gmail.com> <CANQ=N_CC=Wzzq5XG+a+7K5KDOOHo6Z=xBXWyK8AxYmKOVOY7uw@mail.gmail.com>
In-Reply-To: <CANQ=N_CC=Wzzq5XG+a+7K5KDOOHo6Z=xBXWyK8AxYmKOVOY7uw@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 10 Aug 2026 10:27:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCsZPwGBk5GzmSdK41fbfch=1=3dB=poH1iNoFgkzL6orQ@mail.gmail.com>
X-Gm-Features: AUfX_mwwNQpW8GlB4dNKVyUAmz2-_xl1hmHJEgBUA2BzwQE5xshe4d84rPzmeRo
Message-ID: <CANiDSCsZPwGBk5GzmSdK41fbfch=1=3dB=poH1iNoFgkzL6orQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Make uvc_event_control attribute name
 array const
To: Shagor Khan <reza1234khan1234@gmail.com>
Cc: hansg@kernel.org, laurent.pinchart@ideasonboard.com, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Shagor


On Sat, 8 Aug 2026 at 11:16, Shagor Khan <reza1234khan1234@gmail.com> wrote=
:
>
> hey Ricardo,
>
> sorry to interrupt but it might be that the mail I've previously was left=
 behind, it would be really kind if you see my previous mail about ensuring=
 that there is no variables left that could be constified like that, I woul=
d be great if you accept the patch even if it's a very little one, I'd be g=
rateful to become a little kernel contributor :p

Just give it a couple of weeks and if Hans or Laurent like the patch
they will take it.

Regards!

>
> Thanks
>
> On Thu, Aug 6, 2026, 15:45 =E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=
=E3=82=BA <reza1234khan1234@gmail.com> wrote:
>>
>> Hi Ricardo,
>>
>> Thanks for the review.
>>
>> I went through the whole uvc driver looking for other variables that
>> could be constified the same way. The attrs array in uvc_status.c is
>> the only one of this kind (an array of string pointers). The other
>> data tables in the driver (exposure_auto_mapping, cros_colorfx_mapping
>> in uvc_ctrl.c) are already declared const, so there is no remaining
>> group of changes to batch together.
>>
>> Thanks,
>> =E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=E3=82=BA



--=20
Ricardo Ribalda
