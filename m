Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC79156F45
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 07:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764762; cv=none; b=tPoJb12lOOU8jV95osTMOrSxPwiltB2wtP2XvgPfwQoYx3kdLHjLaG4av7fT20WlQg1S+d48HfHyupcG2db3RXZTI70JKW7TEFNa1bNJ7qoqMw77Wcc4obv5MYlw2amblhAhWxKagn3EE6XqTmFqj4b5H4KYzY10vRTUi9YWqNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764762; c=relaxed/simple;
	bh=CmBZsYFgrPsEOcd0hIuvuutmtT9Mq0n4oHdhqCx6j0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSV4DcnpeTeocG+BKV3VvArGlaE6QgwGX7utPvmWKkxjfMqc28lxHJ+3Kpgi9MOk4exHJgJGezEyHupLNyqLP4dQTiUB7M4oG8zBe4hkRDSRmj9DmL/512eVZe6DuBu+qXbc8puEC9vJ+xuHC4sIEyyf8GeyfylvObkbXj7z5mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiRTCof4; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiRTCof4"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so1934066a12.2
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 00:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764760; x=1789369560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmBZsYFgrPsEOcd0hIuvuutmtT9Mq0n4oHdhqCx6j0Q=;
        b=PiRTCof4lfaIaFckjqnQH8IcyHduFlwgl4HkMaSth+t+wH/I6PmHONzypu0BNS8r5B
         L7qZjCnTlfBFDzeQx13SheJQRCQsFsocqajzZqTC+HK8NLMwTmeLu31RAyOJ+OJU2l8c
         JXE4PHzQHIpcLlZMK2UXDafBvXioGq+NMVYUPV4lLMlYaHdAoTmYMW+P9SkROJVYLE4s
         SEH0W6RnbWv8MVKMbr5GSjVOebFRrlFV3mhBjfjpj3qXIaWcPd3IX+nZ9SYlPcmf9pWl
         8RxFdVX2+6QMo19Xf3VFSpoA+qvdfMwSqHY844eVprsv5hWgs8X4YUBG8w3sig9T/X1f
         g7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764760; x=1789369560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CmBZsYFgrPsEOcd0hIuvuutmtT9Mq0n4oHdhqCx6j0Q=;
        b=KaBfBn4MsPAfM/Kn5JeF7AiEJcjxUKN3DfaI5IyldmrWpcEOY7iYHEM55VyGMHsIos
         Y821IrTksvXl2EVCoz7+Yhq2o3t9LDqhKs1f/TIz4/KHXTnqG5jfYtF9T19EcngDMmwx
         mRnzCXf5edNEZ49ORm8M/MOfHRTA9vH6gocRSZ5bgT8jw5S3Wdi2d/GtdgL8x3cVNiTu
         OcD9mzbmU/60LsJboFdx4VeB8JeZxqn0H2MwdyJnk/m6voAwasrcDVCIgCmcuqOXOy9F
         5H1+G+vp3CLs4DYewHHRvK5X44v5AZwt8ZkwksXlW/RClZhgkb+C0OQuMB6jm1Je44wO
         HlVA==
X-Forwarded-Encrypted: i=1; AKwUvByHZ2OgtNSmzI1XKXaB3YoYpgDFc60I43kXzdM86e+LjGxMmSZvC7ERc4M4z+nzoZM9QUfxnqr6f1sYeA==@vger.kernel.org
X-Gm-Message-State: AFuF++nz6JITVWvdUGpb4CpIht2pV/8PoEmooxn3uDixD8+kNbSSoarO
	wPNe6PJVS/l7xgcinsBpjc5pIlqLjlLPhgoLBV8XVx3xodphCJzHbU2K
X-Gm-Gg: AYBFou1/rzTWzjzAXrnOQ60mDD4qtvw7XcssEFtq3ULoL7w/8f/ARW45KeHgz92QquX
	/PdHSTLK1fq8fE1amF25+U670/JM5N4jDwSZtB/zLKjnyoXz6IEO/tVCsN6JqBSzdTugNO4UvPa
	DFLjPdtM0u0yx4DBp/toea9HXtZ9dNMG5iRLtBTRjmr4yML3rdV8o4nQjrt6qkvRziKHdoBCLEf
	YbyX2SR4ZuBwiouIYVfInra9xvquvtXGrGSUAxLjwP/MPpSI7XiuAFsF0Hsx7pwhw4PyPwaeMeJ
	khd28KDQE6VQFHK2UgzOXPnXThTCpFWev1AXyY70Q/ny2PFzKH1qSNCZlaQCJeJbn0ylzYZHHla
	saub6Sw7PFYhhobGkSlD30Z490ybl2EQJaNfwamJFPv/WcujJspg7/PKziEsfjZ0je6AeY+QOe+
	Mc4l4gWWAOzFt4BWXMaOXPcnwOy5d8QqiiwFDWZVqO7hBR0TBOGH+/CVExQBFCW9MIxh9M4abhk
	WUVKzErW6nGEKT5Q4ShuArSrhOHe8+qFY+06WTfLh/ZUtPjISwrdzBlGnIXUaHn9wLGkOzG
X-Received: by 2002:a17:90b:1b05:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39b262a89d4mr29356397a91.17.1788764758817;
        Mon, 07 Sep 2026 00:05:58 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm12128847a91.5.2026.09.07.00.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:05:57 -0700 (PDT)
From: Wei Jie LAW <98lawweijie@gmail.com>
To: ribalda@chromium.org
Cc: 98lawweijie@gmail.com,
	guennadi.liakhovetski@linux.intel.com,
	hansg@kernel.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: Fix out-of-bounds read in uvc_ctrl_status_event()
Date: Mon,  7 Sep 2026 15:05:48 +0800
Message-ID: <20260907070548.2528198-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCvMZzb3ObT3401_iYeE3g+n6kYxTpZVJoDrx4N2_=jrHg@mail.gmail.com>
References: <CANiDSCvMZzb3ObT3401_iYeE3g+n6kYxTpZVJoDrx4N2_=jrHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 7 Sep 2026 08:51:45 Ricardo Ribalda <ribalda@chromium.org> wrote:

>
> Hi Wei
>
>
> I belive this is already handled here:
>
> https://lore.kernel.org/linux-media/20260813-uvc-status-11-v1-1-2cf43e9590b0@chromium.org/

You are right. I missed it out and the patches are logically the same.
Please ignore my patch request for this.

Regards,
Wei Jie
