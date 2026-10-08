Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FC6296BD2
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467761; cv=none; b=Vq9qNKfF9+vwqG6WcYqIMvMffR4QuUuATYwwhHKN+NtWQ4jupUFh8l0mZGKfNsLC2rwq4pU/uBdQPUOUQ4CKbPQ3iCig3xKicRWl8r+yxAggem4DMiPfg/dIK0NuqVIf80jPbZK0fTEpuEaehAZGjW012z20i900SV3daJpo6bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467761; c=relaxed/simple;
	bh=IugQtka+on0o0O1X2K0wrQ7qAcGaGS8gTystabNm8r4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDahd++5NjVcEoFx015G9MiRcydkBKAnOgBXcnoTMrL8aPyR0Jgvc9WB5stbr3C+ER20wWsPFbvH4SmDakJCeqSb2JE4LlgFovAUNFQvTkMJ4Jf9tx0DmDT5vva9MNBIS67V/ZVVK8jvKv+q7E2ljYDZQEPyxbr2CKQw7Hew5Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUsLp4u6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUsLp4u6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a168355946so28054885e9.0
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 06:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791467758; x=1792072558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IugQtka+on0o0O1X2K0wrQ7qAcGaGS8gTystabNm8r4=;
        b=UUsLp4u6II0xhEIeDZm2iP/EeXlbI0ANlAGU+a+kfjehcaXyeU0tsk3pSXjVvudqpS
         6aKGwq+9BwoBEdGxhnUIU6wLZd96sL2RxAzP+X4Fxm6kuzQ9kGyywnee/yg1VxsUqvlx
         qnyZkFOQawSZl4XDlkarBYmraTtOwwSky67ftveJkFKufRvJFSt3z4Mph+HKZ4WOrOVs
         KKIivkEg3/B+xBXiL4EHs1Ac2ULYxHkuXUVDdjIUJvfJpxa+eWjfONcpTFEeu3vUif11
         Q0fXYpY3NPqXnbUQVpKD9li7KVEDCkMvjE7VDNcOhHRqtn0aoPe+C94KY4DB7lEkCwOe
         DcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791467758; x=1792072558;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IugQtka+on0o0O1X2K0wrQ7qAcGaGS8gTystabNm8r4=;
        b=Vr5U9nTc473yPI3N8e39g40Uf+RDvseMVokdlU+PhiYygU8vpdB9hxnzjsBRAy737h
         fjCJj3jwCFKvBRUj8L2Z9xg80o752GYVunDLHFXv/NT9MUTCd+Mt1aABMK6Xz5pZh3o1
         uzDZK8pmlYalrmMvuPLNA+m198nwofGnqUSvOQiEEQSugd+VT8muSMfmI4ceVw5qw/f5
         r3jXV+lojC6KshMokuHfz26cjspY9vE8CKjbWbrL1vgiWiC5coOCZdPgR10jCiNNGE8U
         7z0HnPlZMURsRYxhDxFJZNdExEVZb41hKcUyi4TYlspWxqoLzUX9G58ZB3xl5MQlCqa6
         nrww==
X-Forwarded-Encrypted: i=1; AKwUvBwbZf1soBYoNKQVpb9xJK2K9f4P+w5YyjZRaR+RtTEUmMZu1S5F9+fWKZ80nZcnjP49hH2gwpKxnqHg3g==@vger.kernel.org
X-Gm-Message-State: AFuF++kdKF3jQSUtQl1iWtiyTTkJ7uTy5neV4irpRzOF3ASYrhYBzeeE
	6aSZhQOQkdfGS/rMYhsOcnCauq9xyuYZapGGdFCvefkPaYFDRx6d7khE
X-Gm-Gg: AYBFou3sFq5rR+IwaIi/G2Os561AOCg5Z7LE9WezmckIzIc+WUoeUKFXfgx9WSESPV5
	/3ouuaKsI+0Z0DMr+UnDAfrVi/7htldtioz8yD4ZVQanvGvL9qjwcQyP+RpYsSe5Fg3NVYabu2/
	yb1PGT2EhPssGmwCTT8YqyFiqIi7HJm5ayaTwuV4qFunc+kh+v7gKgN21BV2yoN9ii0ghyxVCht
	1FnhrB7uQqV4lrAqZsDcdjRJXb8TdLwf++kr66i0FGFcZvCaXDzl4IPpzlgAGSMLlt/hOzj16hd
	Dcpsi6IWt2H7ybRlqCWp/uSku6deODHwgzVZ/qxx7UeHBIZ0W4Wy2wyPk4mRkusp/CZCVWpPU0O
	5KX65xgP22LOapmov6SNgChdm5zxJwUioiYlV7YswVifqZFxBA9MoKPwuytXUATJGgfJoOoYLLT
	DMa3x4+UuiTzZUXWYPeeSOe9LFGTDJ1RgdEYCSvgGaXItnN6v5kfjKRyhPNzmfplBGNnB/ThRZ7
	vT29j1hLbPA5FlsVylSydPyRGJ0d1nllmv2x7DYSYmpm9eCmjsCggKyZq6MJB1gJJ7Ed4L60mog
	acTdRXfkFz24ktNMfEQXJk/XPCZibmDmFKN3R1e+3jmilcyqG2wWdJqEf6Upc6Uo3EvdmYNGPyk
	zaWZORiRBFBSgwa/4xBQKKFJxK56P5JbYtlV142H2
X-Received: by 2002:a05:600c:821a:b0:4a0:1e68:d28d with SMTP id 5b1f17b1804b1-4a180303f9cmr96009025e9.6.1791467757952;
        Thu, 08 Oct 2026 06:55:57 -0700 (PDT)
Received: from [127.0.1.1] (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm224950695e9.2.2026.10.08.06.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:55:57 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, nicfio@gmail.com
Subject: Re: [PATCH v3 2/2] media: v4l2-subdev: Fix NULL pointer dereference
 in the EXT_CTRLS ioctls
Date: Thu, 08 Oct 2026 15:55:55 +0200
Message-ID: <179146775576.53729.7241687195832895526@gmail.com>
In-Reply-To: <asdz93f28oRR-WPu@kekkonen.localdomain>
References: <20261008042600.275884-1-nicfio@gmail.com>
 <20261008042600.275884-3-nicfio@gmail.com>
 <asdz93f28oRR-WPu@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Sakari,

On Thu, Oct 08, 2026 at 01:44:07PM +0300, Sakari Ailus wrote:
> Unregistering a sub-device node isn't doable safely currently. Addressing
> this properly requires much more than this patch does, and also I'm afraid
> this patch isn't part of properly addressing this either.

Understood. As I wrote to Laurent earlier today, I have withdrawn the
whole series: both patches only narrow the window, and the real issue is
the lifetime of the objects, not something more checks in the file
operations can fix.

Thank you and Laurent for taking the time to review it.

Thanks,
Nicola
