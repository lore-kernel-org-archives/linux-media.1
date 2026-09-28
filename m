Received: from mail-yx2-f34.google.com (mail-yx2-f34.google.com [74.125.224.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2D22FD1AA
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 18:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618542; cv=none; b=NQBTG5clWS9BkY/E8AeoeFb9PK1UDeOjozmwkdQM+LHVN0g2xj3IhhJJTOhmJI2IjFuRqjwbpOrBQnCjIq7ywyGrU48CXvIlz2QwJWdryUsJipohvOS0WDu6qa6HxwqqNUmDg7+wl7o9zplzfqPsuq8jOaJ3luJNHE2m3lHPhe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618542; c=relaxed/simple;
	bh=KZQA10YBDq1AylwXHXUOFyKjs1PPXoqJzVaib0gTfd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H07gBQYxhNfm8ndP1J7wD4NAwVGWWNZfcbV3n1ZajpT6O7mfoTZflNBHedaQf+sljv0UGvSltcXUF6OMGKMepWskhZoJYks6lZ7shlL1KuLOKKsZJoCkQYNxGoZBFym+bK1b/bJT+g3emlaWJa5sprVbBu5Xd+9GfZuCb6qPrgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDf1yXCU; arc=none smtp.client-ip=74.125.224.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDf1yXCU"
Received: by mail-yx2-f34.google.com with SMTP id 00721157ae682-8961cca9193so47623287b3.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 11:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618540; x=1791223340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZQA10YBDq1AylwXHXUOFyKjs1PPXoqJzVaib0gTfd0=;
        b=BDf1yXCU/sxH6HRS/FLfjGwWB6YAcICtMpov/2QewguXMK6GGd8o++p2zrJZ1ZiquA
         LiqW2Gs6fgv8j47No8Lp04Xrrmy/bhZJskltmREudKNabO1u7fa/+HSBiE7zksyK8rNa
         ie/TXxQiP57GYrwzcl6YEwn+hdeM3SwO7OkmPKddgaNbVVk9EFOlV+jbjvoqIO9c+7T6
         IL9FR8mkLTb7iXDQxTUIViv0W9BgZde5pn3n7yeiu3qgUom19fpIKzk8ax1+edcbC02u
         0XP0W9+5pd/bpwten93iSTw0tPMMd4ST6hN3+AngOirgrUajf74fGK85RTc3H1kD1t1s
         56BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618540; x=1791223340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZQA10YBDq1AylwXHXUOFyKjs1PPXoqJzVaib0gTfd0=;
        b=pThRJrhjaHyajWjbqXYebgjYfdERyNlb2gKEN5YarMH/AMq7po1SYJmiHevAgbgrD1
         g0qgZRAgVAL8ohwLfdS3/E0/OYNP/4qqNAs2XFY0JT0pFsyQlsO3bVMjiG12FiDhsh5y
         oejgAh22Jk4cySvPK+G1BVYRfGzAtDfkhe1TBEUiIdQyQK5UbVmcRCR5xzDByE+j7D4A
         mKB3x2RxOCnsRv1o5w1vxl6yl6hVteQ9ZXGoI/hkLYuiuW++km0JrfIm1VGNTx9PEZga
         cfpxknHNY+32uC5m0mwMMff6yURUQMWq8uDg5skyIprrTgvgfi775KrJPBfGIAqlMBIZ
         c1pw==
X-Forwarded-Encrypted: i=1; AKwUvBy/yUKZ2dRYXKdCL2ZR8tdD45ySqcADWDRCFQCQLpPHvubLVoNvb0SsDvpKK/GsR+KAHE6gc5GFKJrNMw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKB3QC+jxnBzXHoY59SxRh1Rddkw4yPUju1OJeGnQz3Ns9avR6K
	8WJ5iR06Koe7OMf0ASI+l2TNfNzHWnU1nNaDN4BG8aukbDBYXaR7WgQj
X-Gm-Gg: AYBFou2JLv/+A8fqySzbf2DNYlbe8fAfwjaJBa3EPjuuwwGp82JZDbNLC2s8oLI+Zsv
	i0ZoBJEwft/ZQHbSah4DNLX3mvqWPM2T+MXkGFp2rBjxM11V+pSi0rxquTnGr62WvSO50OFRHCF
	SjI+2dvILiZyDq6BUshtsjI6CFsGaT/rWA9b+toHffDy+PZcXWRw4R3BFysgj08wGrWfsc6AryO
	+qTMWhPXbmztVzRrwuJ/XRrZuBr0VojSJWygRA2bpSPuxUN8U5cvH0WIK2lL3OKiEXKH9vuCyud
	/Ym17rA9eDS47o2vNEViCoytl3XFiq+RyO/0h5abntP2SyyuolTdcS/+jZfO3XbendBaxIDp9r+
	6Y9S5qHT3AKKyoYROZSq4ZLh2F+mLXD36fjj6KKv0hRvWf8bYUUkS9ZwDpiEABm4TuX1CJ276hY
	UYEYAIJ9ndeOSSIdyHxbsbC3HNu/OVT9P9Qk+CdEHD63mxwmu1wx3BATYFHbFv8KkZLFZ/lN0oF
	MPQtqCY96FMcw0/ethwYzxZkv8h+TBjnici9fa+jdsmGBTxf4V3HQ==
X-Received: by 2002:a05:690c:e3e1:b0:854:b86b:d206 with SMTP id 00721157ae682-8a6461b8773mr74828367b3.12.1790618539927;
        Mon, 28 Sep 2026 11:02:19 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860326244sm47122057b3.6.2026.09.28.11.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:02:19 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: uvcvideo: generalise the XU flags fixup to all controls
Date: Mon, 28 Sep 2026 14:02:18 -0400
Message-ID: <20260928180218.788643-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCv4R-ogez_NaXdx+q+ejQLKhPTqdR6Dx1-HAk6Y3EHKsQ@mail.gmail.com>
References: <20260928152416.766957-1-jordan.mymail@gmail.com> <20260928152416.766957-3-jordan.mymail@gmail.com> <CANiDSCv4R-ogez_NaXdx+q+ejQLKhPTqdR6Dx1-HAk6Y3EHKsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On Mon, 28 Sep 2026 19:50:01 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> nit: I think that the current way is to not mention the model version
>
> Assisted-by: LLM

You are right, thanks. It should be "Assisted-by: LLM" on all four
patches.

Hans, feel free to change the tag when applying. If you would rather
have a v4 with it fixed, let me know and I will send one right away.

Michael
