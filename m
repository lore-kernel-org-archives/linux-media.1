Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60443BCD13
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792245943; cv=none; b=IdtfGkxSFpBRv8fBsFNoPpyH3KNws9PAD4hcSYBLcfM38nupPnG79W5Wylc+BtIucvJE0cEiIOI4KzuDT34+isGtdrqSnuJ1STWI1N56oDCtS65qxxYRuAoqRhuOwwvI0Ldb3KDVoujPdWnidfYeaICOx+tfC6Pk/41UHgVPf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792245943; c=relaxed/simple;
	bh=8mm1SkJAd0ZzUVZM2VvxblTUHLtQ02hFHKTpaC6z+4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeENgHieHCEh3YXDvZXAmYX9w1mtVe5DWlcM63MxRyhCOaott8UAofszO3kKiXlRn0U/LtOfIoYH63bg7NSlHKKrylIhdG9h4xD3ZzBynvMfhzmkavxgzgQxKKE1EYYcCsCd2/Z1eDeMlxXrGUaai+lZUpls5/HuPkPsAwplzLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeYyaPt8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeYyaPt8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e86dce4510so3012055ad.3
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 07:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792245939; x=1792850739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mm1SkJAd0ZzUVZM2VvxblTUHLtQ02hFHKTpaC6z+4w=;
        b=VeYyaPt8PREiPtLtJRVPa+RVPr0ExIzP5PD6qgJsRqyFK1B/EzDn1J7ZO18eS2rFii
         8uY4pyLPBgIVwcQiAo90QR1ICYG466+W31sUAop4YbX5mWaLiY5QgTBme2IT2KoIJquc
         7ZBwBuxd5+oUBVIZm+dZBJFTKi7QqNZFeXU5f+q4fZX8pFDEfT2dEFxI7N2413QYtLU1
         UJdKzr5KSDdHgxmPeu9AMC3YblKbC9I1txxJZzQG4SfTndNV1zCqyi2kjmu4Zky0LPr2
         LZw9opU29Xa3oV+5J4aJnkzgFPOdmNI0ZWfVzmj8jcOSLdTBbIrd2qYAogj3zRCq2W5Z
         Im0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792245939; x=1792850739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8mm1SkJAd0ZzUVZM2VvxblTUHLtQ02hFHKTpaC6z+4w=;
        b=X9tqyItuEMZ4UVG8qfde55EDEnuJDxFshV/X0IcxiTrqvs3Z8Au6WSL72+gzp8yYXI
         QTNLupIXgV+dh5VLvRNeaiXJOKhnHMgmT9JBJrjE1NMuXoYpAzHdxaQlFFw8cG+tOx98
         kseyYHR873rAliM5WZ3u2xd9W06eLxWDRaokOUmbzO1laL6Kcg5wShMnKwOS2SSDz2OM
         45qaA8W2BVWeclYM4hbU8IrVHMeZj0kwH4czXA74Pnro+aKPI0QACiM5fgwt79H+6wfR
         I4revD04olHRQX5PYhVzYwVrsjl3OM2moKsOTKJ/QHtyDynozJYMmdfuz6JI30ZMKW6G
         ErXg==
X-Gm-Message-State: AFq9FYIRwpEMRrKLsqMKSUxJa73gJqijDqaMwXxf87TOo3gnD9R/7E8a
	ykxYa/AfycrcblI+Eg0ho226syquGwv9mJYwoDqFZzkKy6BPNsWFHFbS
X-Gm-Gg: AYBFou19Jcf5EpUrVNSy9Hxa37ve5b6tmX+GRol2BDSGHr3H8grbSr4Cp77z/2qmEby
	qqxZISvtGHlcsGxoQz194X4a2W9bY6cPQlAcrNnxoc0BTIHLxShQDhGwhfBvhirzUeWj/tmqVNx
	3DeeBk3GOdTgx3S+FUG8bUdnZNtJyWjm3q9h3gWg0yoN9rdsMkpV/RBVQZnCACDS13fJInLgmpQ
	QT0nk5QCNsgmD8c3YRE/+qw6axtAdy2+NqyyVOQ31szfYkqCnJvxUUsWrWwyFXlBtQ2mb9DjpSn
	kmgAUupOHO3/fPDJco11CSoVW3hMY0cbkQ6SJcrY5GeEDI33LGGD4xX7DB28JJ/OqLfvePfuXcx
	6CnpC7IVSG47wLATTUPsyg9s+t9eXesl1cZ0G4RtdM8PIX0/06kkhloIVzZDcWUJ30CbZ5/zlii
	bxZPrNaU+p0zH4UiRry1NkB5HdPF9eiubXnLb7lY+Xz64f+bTIc/K7ef4v9eT0A89XK3KO8igGd
	i/lhi69cpJts+a+KuDFGM5nFEGtghB1aBa/QbtqnJcfEabab7Za+Y0ohkSClX+W6EV9QibQKmD9
	48nXFCNARTa8DxsXwvvewtH5VOztp8tFJu2wV9HgB/5b8JywwBoqWj8=
X-Received: by 2002:a17:902:c943:b0:2e9:5eee:e085 with SMTP id d9443c01a7336-2e9a68da44emr20543265ad.19.1792245938535;
        Sat, 17 Oct 2026 07:05:38 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804eb4sm21848265ad.20.2026.10.17.07.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:05:38 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dma-buf: fix stale return value documentation for dma_buf_set_name()
Date: Sat, 17 Oct 2026 22:05:34 +0800
Message-ID: <20261017140534.3264870-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902135923.3599022-1-alan.tseng.cs@gmail.com>
References: <20260902135923.3599022-1-alan.tseng.cs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sumit, Christian,

Gentle ping on this one. It still applies cleanly to next-20261016, where
the comment still documents the -EBUSY return that commit e73c317efbf9
("dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME") removed.

Sorry for the noise around v2: it went out three times (2026-07-30,
2026-09-01 and 2026-09-02) while I was sorting out the recipients. This
posting from 2026-09-02 is the one to look at; the others can be dropped.

Thanks,
Hung-Chun
