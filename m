Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9493C1C861D
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 05:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790572052; cv=none; b=HRovTAjO9PKb0q67lu4pD3pNn2foaif60ORYtCAuZaWLWBrv/77XkO+9Si/WbrGj0y+fcfp/S305P8jP9BMQcWw4rZsv1ohq92oslAt0LQ7yy8EohJSOCOrbuoxsHqmZ9EFwkPdc+ZC1htjZu4TAVs1RAu7+5+Ji01d7nPdLwxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790572052; c=relaxed/simple;
	bh=cBbmgWLkTygFI2uRkgGE78CRY5thYY1pH6OrLNgGW6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SUOWriRgMvAEOddL1fzw8wJ8dFtTt6tOOrCesDSJfjz1Uyab7ZlGQsQh6+PTkVwK995VIcQ/wYo2QlxPF4Kpnj7iPsV1OMM+tU4/MC/o0F9pqSgQZAUZUh0jfGsVdK1nQhkPXQ3QzWervP7kyxD9ehnvFdRh7YwtmPGfY1+ewNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr; spf=pass smtp.mailfrom=korea.ac.kr; dkim=pass (2048-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b=AwKPLFLI; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b="AwKPLFLI"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc74520b20bso601981a12.1
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 22:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1790572049; x=1791176849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsssqQqsH/k0kClUG0kGbGA89DoV1qMemL3yMlvJcq8=;
        b=AwKPLFLILepeIex/i3EGlDc+KhEMu/bDOwM0UE2/KsX8GLk9X/BsWMpz9Lw2Lt4c+N
         JIkUvlWVmetqAy1C+ociejnKlsBzLiwAHGqW3ChfZ/zLv8rSvHJN8HnneqF6HKpI2mWp
         /W0C+IdXnH2TZu8vpDQ3Pmh25Aj8aOCwZhch8WV7cIdCFro/px/rx3C42FTbg6XEBYjz
         FHY7bYE6EUht8/5/b7fz41Fy+InQkfDETfVlozA2faJlK3gLssXx7lQn8v2jjWMztm0Y
         tYmm1b1b7CymLQJwGf60F3lnaHCmSPGxEJBCUBvEJYmNXfzzAPirqNjLS0n19RS3qx+3
         1awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790572049; x=1791176849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsssqQqsH/k0kClUG0kGbGA89DoV1qMemL3yMlvJcq8=;
        b=DGVCfAnXd6m1vhlZib9ZeRrxxUjtVDRqeIUpMdLxs2Yc8qCq5/+jbnsKyKhBpAtGwy
         F/Yi3t5Ju7Kej55F8VS1OIl1AvqrMOmih1OLn3xPq8XhGoFldUqz0miAE4RRbswZxHuh
         dXSfgsngLst++9QAZ1jJCIhwLLu+j/ukcSL/uldTegvQ5jt2/yeWtheJLVyGGQLAn6Aj
         CXsm1wBQjdM50yJeCJmNn4h7qOVYy8iitJCbTrgmwkPMk4+kAUwmtqamgdAd/Bh6TGs2
         ObOsBANTVuZvFjZRBnZ2V42YoJTOjr5dexQTC9yeBXBnkBFvlvAJGMbyM3E0hd94/8PE
         Ad4w==
X-Forwarded-Encrypted: i=1; AKwUvBwbMK1Q9fRY5/xzYpMynKyBvGA5V+BUCs9RQ2b3UOTWtnbZlNZh6MheKTtMbDD+J5TaxpIr7U42zcmRWQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIW8TIvpqlZVwjpESYZELOYhotaS3pBX7SZzLp3KlozHCxpUy/V
	WPUnL1nvYB3Q2DZU9ht4CKjtb1DZZaDkr7i5yx1pHdblelZUl/6XzuhSR8B22RFCAVw=
X-Gm-Gg: AYBFou2hTyDcf/hn+91oDK/B7IGZMCyfT1zFXqcwFdcF8xIh9ZrefAJCTlNEL2W9thZ
	9I+Rh37gaFpJiFR3zUARhkwaDsRDQ/TeAj4eYSiGqNq5cZG2+PvCEM4NxTa1Pvk94YR2J5FMfVv
	XCpsvKhUTnDLHJP4xN5lPukJ1ZUjOfCBs/bazyZ2nPUNWqoAZ5HzSOtKC5hxuvwT2nXGzOM/PVl
	SfukgjqLPLrQMs0V6JygtWRU3+BhYCyf6W11DE+hhrDs2ZhRCmBwd9VxLLfJCsVxrz8lKfw63k2
	kRm/zqbWmKSuQWy74yZm4NkQKa+E2sh+z8Z4R3VPq6obJzrc83naDnPD0tqwK3adSxITQWvAr4r
	Imkf1YA60yrm+v9OwDghxflU7xTxwoAhBKzUwbVxM5SGJJK56t2YoZznNTDpw9ce9BhawuCwF9n
	FL4rmhqlacrfTnZhT1z5erJmbIP4JK6BanliEEF63AZhChC64+LtZP9loCu1zjfUZEBVurFTWzt
	mKWgzSFBajJcw==
X-Received: by 2002:a17:90a:dfcc:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3a0cca04bf4mr3730718a91.7.1790572048813;
        Sun, 27 Sep 2026 22:07:28 -0700 (PDT)
Received: from icps5-ESC8000-E11.. ([163.152.219.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b499a772sm6281182a91.0.2026.09.27.22.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:07:28 -0700 (PDT)
From: Hohyun Sim <tlaghgus0425@korea.ac.kr>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Abylay Ospan <aospan@amazon.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: netup_unidvb: set the vb2 queue lock
Date: Mon, 28 Sep 2026 14:07:22 +0900
Message-Id: <20260928050722.274052-1-tlaghgus0425@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910063826.112147-1-tlaghgus0425@korea.ac.kr>
References: <20260910063826.112147-1-tlaghgus0425@korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro,

Gentle ping on this patch, sent on 2026-09-10. It is still marked "New"
in the linux-media patchwork with no replies so far:

  https://patchwork.linuxtv.org/project/linux-media/patch/20260910063826.112147-1-tlaghgus0425@korea.ac.kr/

Hans, I have added you since this is fallout from your commit
c780d01cf1a6 ("media: vb2: vb2_core_queue_init(): sanity check lock and wait_prepare/finish"):
netup_unidvb sets neither q->lock nor wait_prepare/wait_finish, so since
v6.13 vb2_queue_init() fails in probe and the error path then NULL-derefs
dma->ndev.

One correction to the commit message: the paragraph saying that atomisp,
pwc, msi2500, hackrf, airspy, rcar_drif and video-i2c were fixed for
having "no queue lock and no wait ops" is only right for atomisp, which
got the missing ops in cf738cc7cfe0. The other six already had
wait_prepare/wait_finish and only set the lock after vb2_queue_init(),
so the check did not reject them. That paragraph can simply be dropped
when applying, or I can send a v2 without it if you prefer.

The patch still applies to current mainline.

Thanks,
Hohyun
