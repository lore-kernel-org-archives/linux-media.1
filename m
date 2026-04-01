Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEAE386C3E
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029703; cv=none; b=jN183e98/KmBJHKj5sdM+knT4pLWMw5oLZV9dzVYArGCZY2ga758/1VFNLgl5gLjopjb9Y1zEQznaxMCMUvCM+l1NA/lqg5JIG1eE9lc+K+4XNrwcscC+uqKeH5fvdz9yRsDVT70GeIQK6UMXIC/FyjaTt3ZY9bahWyR7SXnnz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029703; c=relaxed/simple;
	bh=gCYniU9+niBnKTGH3VLO/XgApAfcaMyihtv2PaxvBAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kl1AenvFkMDvVUHaFeMrkpBXPRrvXFgAOo9AmcxgEDImthtzErHjCPHK5eak9HKk1vXs6nntSINzKG1Dt0fJCkTyARZIqlawgZsDvE6UplutLk3eAr2kGpeQFMR9IA3YVWe994wdjXZaPIjldKyHVBQEIRwVT0gicLf+Ltew67U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLY0cj84; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLY0cj84"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82cf636dac8so9732b3a.3
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 00:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775029702; x=1775634502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=352ocjL7rTrhK1rZf4ebKK7A7ZRbDOa1vgQVBw+5g3A=;
        b=kLY0cj84n0iRNKqXyh442pfV6ID3lB2VuY/JYfopttSXx11c8EhmFS8sro9XcJBCno
         pMItK38JvCMb+kaHiA6jdQQz1VIb313u89ayX8UQQ4S7rOUPsvrqx/SKlllaKwwJQQWx
         8sZgKPv67PLYxOFzZTkpagBOQK3xcyeTcpoL+Gbs9QE2xMCvH9JxiA8fO6fKChgzXoOG
         +m6YFt9WrjWlr2ijs0jFzpT9H9Be1tO0uN+ob0rjlhZfVf72r8tCOlcpwixRcwRkLAhE
         YCcT44VkgwJLNjj8JJ0QYAEUiM8ofiWjUDkCACoTB6Em7pgAj8cj+Nnrit9oUw3F/he4
         0XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775029702; x=1775634502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=352ocjL7rTrhK1rZf4ebKK7A7ZRbDOa1vgQVBw+5g3A=;
        b=mqT8EIARZVwIClhgeisU7q0um4Vm3sdEGBfpUKcCV4qh1Ia9wxubOLVVCd0p4oR641
         xDKXNQQ/KepDZAUtxLqlUyE1IHwCreU8HSK96NIFaRQwukqD2t1qJ3docZ2OH7yeEuwK
         v4W9+SPvRdy3YTINpGB85p34q3KsKZEQke0l8fWscTL7utRqfPvrgqqshYbHmcPMrO81
         njTb6mvI1KIE8Uz4LLyEKSoIDFB/TIS6n4tG01VklS3WnRF9pCPvSLECyWR6VSw81vmS
         Sq1pLTEkx5GfqwlA7ETgUJXNh1vjPdWvm20nf4OczqiDLgqBV4VUAgN+g7XM7JJcEY9b
         Bo2g==
X-Gm-Message-State: AOJu0Yypvl8MOcGHwcHcjTmQ6+/1yB5FDPECh5+JIsyNga3hHxbVhnGy
	wT4S5QCJLEn2CuFHYp1LFkSPdiZe7sxO6vGxG+kTNsN225O7TY+uUhwjTQxwxCtTsS1Osg==
X-Gm-Gg: ATEYQzw7/yPScxJH2i3elPiPsA0fyolCIOs9elbxvUnqlY14Pemjrx0cBZQad8pv4XG
	ZAGXHZiKeYFLZClH2pKjZtZ/7BYYfybm+9fCwcikoQRcsM1LV9zb8tAk1BTfUq9u7uUXlaiurf5
	9p5IwCHVF2o55Z3HBCbQiiaDqxpGkHTmOeAsGT2dWwNWoG7VXFmLg2D3+NIMePB8rX0nZ6mr9m5
	YxDmBtAAhmt67ifpWkaSXdw5qLK2Epchv2ZDdLQQdoO2hfwKZX5aRfchMU5opkr/VTIJP6WQP51
	VH/fS2sa/8Zlm54rTzDYegugu8ZhQZPWflm495MLLQWbRNZbEzR7VX/h4t8We0kl2N7r5AXs1BR
	rNjP9rN54IED+2eo0VdtSWIW3FzguGt/aZ2L2pOPeuRWaH+CgPD5WctDAXvsehXkyLhkjVibRll
	mIkyj+XWWa/Dyx+rj08Oboa9l4U7SWxXQMVtkQWrq7GJN9JQeRB6di/M2epGSxGikD+tgMrGS4B
	qG3BIDkxlumzQdjRqJQs3q2vrevI2nXYSfmX6Pqh8Rbj1G5xhY=
X-Received: by 2002:aa7:8886:0:b0:82c:db50:ef77 with SMTP id d2e1a72fcca58-82ce8b1ae99mr2940476b3a.49.1775029701708;
        Wed, 01 Apr 2026 00:48:21 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8465785sm16796789b3a.18.2026.04.01.00.48.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Apr 2026 00:48:20 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	xiongzile99@gmail.com
Subject: Re: [PATCH v3] media: vb2: use ssize_t for vb2_read/vb2_write
Date: Wed,  1 Apr 2026 15:48:16 +0800
Message-ID: <20260401074816.31443-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260320113052.46989-1-xiongzile99@gmail.com>
References: <20260320113052.46989-1-xiongzile99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A quick follow-up on this patch.

It looks like there may be an issue in the CI/patch parsing path. 
The CI output seemed to pick up a malformed/combined version of the patch, which led to some unexpected checks around the trailers. 
Also, v3 itself does not appear to have triggered CI.

v3 was intended to address the previous feedback:
- add Cc: stable@vger.kernel.org
- fix the formatting issues reported by checkpatch script

Could you please take a look when convenient? If needed, I can resend v3.

Thanks,
Zile
