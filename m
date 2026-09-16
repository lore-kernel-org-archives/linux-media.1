Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A65C44E67B
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 07:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544251; cv=none; b=PmIxRYZEylMFm9PKCaOUo/sWrhMMa63J7p1h6fV9jX4EobIvCok3abwo2XNHtd1pImek5Kw81e8aP9mjJ8rz8G9SI8qN2GzGWKxJoDSvqoBEUSQLarE2BBB5javNjZ9qjID2024D4f8kvEAjIoClqXezGXLYS7ncd8hgyrKXFQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544251; c=relaxed/simple;
	bh=3x+6rjHOdFM+ukeG5dKUPQOJLlodagt5Tb/55EQ79lE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NoVdanTgQgKUyrxfVwjKc+p/TfW7p2BXRYJMkJrSYrlkADg+BJt+eFLSQ8XYR/gB9pDT+iORSp9/yaZfMJuorZth2csJX3ry8aJQKoZI/O4rT2CHiEW4G75r7yF4mPwURZOCg3FxKHPnKUaoe/pOtmQiK0eIjR2rT8ujGKswUXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iKt1psIj; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iKt1psIj"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0135fso6081645ad.0
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 00:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789544231; x=1790149031; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3x+6rjHOdFM+ukeG5dKUPQOJLlodagt5Tb/55EQ79lE=;
        b=iKt1psIjHwqsDRiDCxpviyjCFb5oResLX/C5EEVt740nEVoPaY/sHo6n4pzMOFKh22
         PBhzXIXGA+5JC1OOPA2TtG4PZxovPs4IiuJMhv1odvFUk+dm4T85S9hPq0sWd33iDZqp
         nfCY9TPInGyELTfPPzPK8LmwNYzlP527+yW5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544231; x=1790149031;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3x+6rjHOdFM+ukeG5dKUPQOJLlodagt5Tb/55EQ79lE=;
        b=SRFTlrI5gK03a38MwwrRt8+k5oblXp4IkWuOuOoVDQKoxLnps4nByTvR6vgsRDlopB
         TQyVEPFWft3yWAn5wBhvTX+tzgNEVqM0TOPTCCP6CDxsgwjzWjKSRyH/yOGcZwOBfVY3
         v0lwXydPx8R7mNfrrauqYH0zjvhRjijuhSxmPYQi4QABSeYm4Qh5nYUhSo6h146G+02K
         dfAOiZVbdguHceoitnKTYX6/zQjPN3Nu4aSU/rrViB7dmTt+DhSuUSZleEa2SQ/1e1Rn
         Jv5r5tLm+7DusYoFbVL8rVaeU5voxRs0p/xH/kgs27Pd3vIDwp1bTB9guLbZkQe1tDO2
         mSGQ==
X-Gm-Message-State: AFuF++klyJOX7Z9vp6PsPANGG0W9Ts/H2H8NI9qoBg387o/CDS8xjF0v
	hxLYOIOUtQGmeWQKesn0XDp+2q9kIJtwa16BA5OARtkT+UcTBjMUtvBtmby4JnwnnWkLY/h/MKA
	MYTRhWw==
X-Gm-Gg: AYBFou1pTUs5TLexYd76pgj94JXPcnXo2Ezuei/gdjo3aRYGjlqE7fykAuxIuo75IwN
	8aBePUGC1FI8GbC/KufKpLjC1u4auQUf0m+14fdygvHwaK7MYsTZdSPQgWXxo+8+voXyTKg6v1N
	dJ6e7dTVvyNXPmRT+B4b4L+MQwfMekjPMHaCdEChil0e5U+xxnrvDa+LJ5sYr5byDsdoCUo6Coz
	8iDXkFEtYf+BiwQ6emYeTEdJoYAdh2JQAQE8l3q4P/e9NHgSG4+PYztH1jiOYMq7lzmQgg740fz
	fbKyD6oC1sxhbeVC7V5KLskW4IlGOnqDWj++lcSSL+elWEIwieJBNSpdJOG69wA9X6djroXJawL
	UfHY14Bu04ZaZWKTdheMKFYv50fhO0Ni4LQE/vYcIdZijg+kXUqWvMOyGTl4Q9ceX7RPwlkwlFX
	FPWaexzj1msK7T1TabhaCbWLq6jV80Ma5HwE4vMR4QovR8loKh8qENtong5MTEYtvRTvd604uRB
	31vg9mdE8byCHPAMT7OExJulGxta43lx5hPFQ==
X-Received: by 2002:a17:903:2308:b0:2dd:1701:3b6e with SMTP id d9443c01a7336-2dd8e73f93amr32322705ad.16.1789544230645;
        Wed, 16 Sep 2026 00:37:10 -0700 (PDT)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com. [74.125.227.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d9007csm6913235ad.5.2026.09.16.00.37.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 00:37:10 -0700 (PDT)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so7184815ad.3
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 00:37:10 -0700 (PDT)
X-Received: by 2002:a17:90a:e18e:b0:39e:ac:b776 with SMTP id
 98e67ed59e1d1-39e1e5187b4mr3432779a91.25.1789544229188; Wed, 16 Sep 2026
 00:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <NyIyntNSKnGNUZ9e_D85jiYUrnTPBu_Ux5olvRdPsK8lpjI8wYk-xb6sGrx9eK9iapaHROjWS3G2oeH5rkJyAiyjjYocn4CoYdvUoq92Pss=@protonmail.com>
 <CANiDSCsQL_AWPz+spNwFkD=iSuDp5YKuk_0KROvmLNx0rG4tfQ@mail.gmail.com>
 <t3hEIJz-K9HvqsANa0jwTFis2jKV-LIIUZ3-7AUs-sQnAgSsLZhu2013EUO_AOWgospC7Lvphv7D1iyhJb9vFMxnbtUjaKwTljvmHjUiU8A=@protonmail.com>
 <CANiDSCu4AW=JZ9FS+Ny=DK_+LqqytGvSe+V6aVncRiGRiyDMfA@mail.gmail.com>
 <njQpJCsjie_PEmoIZWXlTHCGW4nqAbpwp0ev50qLl-r5rWkV4mwEK0lSvJ-3w9BOPhvZE04A9O7pFeAdqq6-zKAF6tVIsPN6dPA1dnx86dE=@protonmail.com>
 <CANiDSCumxDChOj9JyCW3s1nBhpyeicerLyHSZDh=mTNfxbkGUg@mail.gmail.com>
 <CANiDSCts7TgGB8eVBSw1L8MNioHxD6_KfoW6mBwn9D51crVsvQ@mail.gmail.com>
 <tzjfIh6x0Uwujqr2ejd12rHu20MI9yIVwFE8AnxwHqGnTy6C1AVK6IzI2TdM-0RUriXVnCBZ9jf8hqbCTwyfg0UegbRSXAMp0bym0gU0vEs=@protonmail.com>
 <CANiDSCtKAZhWTLmaDXHJVkUXTiik8v2VdTYjPubU8_=SzB6m5g@mail.gmail.com>
 <JpRUI3y4S8sLw4DG4cIAG-hZh2Kh2eW6jCO_UtqMgui3G1G6y3-a7OzJnqTABPEbFbLaR3H_7BacQSbAqEcOHPUcvX2atXA_eiHYBuIyAbY=@protonmail.com>
 <mJ1rs8fZIGetLtBq6B0Sk5im9xHBJTGxPQvRnaWh083IOCtUXzEX6HwerzTvu1iiARLKRx8CRHdJfKjtgwb_Zqsvw9GFj5sAwux_bhbDN4o=@protonmail.com>
In-Reply-To: <mJ1rs8fZIGetLtBq6B0Sk5im9xHBJTGxPQvRnaWh083IOCtUXzEX6HwerzTvu1iiARLKRx8CRHdJfKjtgwb_Zqsvw9GFj5sAwux_bhbDN4o=@protonmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 16 Sep 2026 09:36:55 +0200
X-Gmail-Original-Message-ID: <CANiDSCuSy5+aBv6dbW9q9YNfYXPwk8YKbp2txKaVUt2p4X-7OQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vx5GTpSzKhTG893jypW-FpZRHGk0MD6piRQwZN1HZ43D3QuEzm_yQAR8Q
Message-ID: <CANiDSCuSy5+aBv6dbW9q9YNfYXPwk8YKbp2txKaVUt2p4X-7OQ@mail.gmail.com>
Subject: Re: Re : Re: Avermedia GC515 implementation
To: Edwin Gatier <edwin.gatier@protonmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Edwin

On Sun, 13 Sept 2026 at 16:41, Edwin Gatier <edwin.gatier@protonmail.com> wrote:
>
> Looking back at the log I waited a bit too much before dumping dmesg outut in a file, here is a more usefull version.
Thanks for the logs :)
