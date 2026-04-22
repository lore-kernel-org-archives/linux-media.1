Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0726423AE87
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776865131; cv=none; b=cCE4a00C+mLoqKlpUGP0sLPMIVgV9eBAlnRwYkYFeA0wNkMRBna00r61OOWja2GsxY9XFn1b/ptedo/ssUyod9780Oamq78Hu4B90X/8x+N5IzazmPkkGoje8Sf9anrq4adRGUctbAqSgMtKacHT8UF9SeaUl5hqz2QP+Ol5GrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776865131; c=relaxed/simple;
	bh=xFaHrn7G6TIcfR41DP0SW/X9082q2L17KKyYzdBw07M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHod1HseHoVosf70CkJrk3DYIB1LEQuX4NCAMUsFuE9XIKvkO+BYxhmriXW9Ed7ETU18GWZ82RWxv27CZIiEfA7l0wSyJ59fAmtLKXJUY351IsfSZZIGl89be5nWClOiCbkzk5DnrDyClY13ifk5DbG41FyG06+nrtYEfsd/pEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS39XqFg; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PS39XqFg"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c7973f67f4dso1592498a12.1
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776865129; x=1777469929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFaHrn7G6TIcfR41DP0SW/X9082q2L17KKyYzdBw07M=;
        b=PS39XqFgmQZmCeuZM/I4CaHj2+fGYnssAvabg6StEaEHzydcIs632h5TzpO0vEyUsf
         o++uf5oXjVdaRH6dvqRJtpvGdlBkdKNHHBvLk0jbqLOc4wwtcwiA79LCdLgMzQXYyBTs
         jSuTEoLKET0NJZSKMSfwkrLcKVFwNd/lSUf+BG8ZpR4a8Nx+Jj8wotsvhpa4znrlSBwK
         0iW4eDR23TDgzfMi1oMesN/FNIWy9d3Wb2oc9mPfopEOw2c1CTOf8w3AWTJPCP8Q0RFV
         UYv4PhOe7BKe6qaFA8kGDIvyu47FjPCWmJHDhKGlUO7ZLxdDNyvtQKHe+1YDmPmOgnqF
         uycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776865129; x=1777469929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xFaHrn7G6TIcfR41DP0SW/X9082q2L17KKyYzdBw07M=;
        b=Dj952rG81hdPcN+uzEccbOSaloaPGGP5en/tAuPCa8MVCjyZlSQap7ejZYhHzMcbhq
         SlHbqoHtVTrSQn4fACSIemCH90JUeQ6OAwIpR9BfUuFqLDTEiZyPEkFGRlRWzubS0N9o
         CUpYrMFYT/fV8HwyByXoaKNiml2fmA12I1UFYANMZfSQTuNuvo+KP8izoC7phILUenF5
         RLgijOUAg9hLq0wBJb+e7X2SQF4cNzqsG7TGl1vg07sK40apS3iyjiFxAUgZ/jYasWuX
         QsaFENwJXnqyAKw1juFrnioQo3pQCUje2UpQr6M92vw6TkPuZKPNOmZq2jGlfjJYshC/
         vnfA==
X-Forwarded-Encrypted: i=1; AFNElJ+PkDx3/+uBQhAaeQwLMiiSG3mLQFvtaGT94jyPbCvHa8J8SRSDD5FaG6MrVGUrCgggiKfqDc3WZg64lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDh9+MytHfrDukaePqLgNb0UedrCKF/58GkUIRmIcvD/CCwGx7
	8pbDPz99wKhLwdeEN9NHelE+wU0VFYT9xjyJQaVlDbXvF1YFl7q5IstD
X-Gm-Gg: AeBDiet/b5Yi08jQAySHFKKBUu93y2t01gV9ptcFh4y9t5kO7/DWxtmd/nmLrcimTuq
	epyGgg4sMrxKxaifDwsgJR5KU009RfNhNkAmuduckPagglow/3rrmp35uc8LmWqKn4Si54KMMC7
	RqVkbJjg01foGLw98mbyHm7B05lL80yIIpD9OGyzT9sKkPihU3TqTyFBoOxLVJ/EDJB3qSIha23
	1LVoI9M6mMh2d5lV5pga0qyCeE7ecnmfv1y1Um30h/1mHYe2GErcyWjgqay2sbnmu7aznB8KS+I
	oEZ6z03Lo49h7lsDiDv32/Gn5pRn52y7M4no4kq5IGB+pdNLLMvEHc4htAHeGPUYy3pjtJR/ehh
	dzeygB/xgH11lfC+FfNNKTFebDBhBB/DmQgVZa6y6gd5ckYf0/BoQ4RBVbmhjeAtymCaEE4J3E4
	d4Vxgmqhk7LFb0tpajk16WHWvvw0DFw3N2d5z3oZRPmEDA5gcHNc1+
X-Received: by 2002:a17:903:2781:b0:2b2:4dc4:18cc with SMTP id d9443c01a7336-2b5f9e5ec81mr128342005ad.12.1776865129300;
        Wed, 22 Apr 2026 06:38:49 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cf67sm161528325ad.51.2026.04.22.06.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:38:49 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v4 1/2] media: atomisp: csi2: Remove unimplemented DPCM decompression
Date: Wed, 22 Apr 2026 19:08:31 +0530
Message-ID: <20260422133831.57318-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aejF4OlVJtKSknxg@kekkonen.localdomain>
References: <aejF4OlVJtKSknxg@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,
I've rebased onto your atomisp branch and generated the v5 patches. Should I send them now?

Regards,
Debjeet

