Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209FB476CC3
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932685; cv=none; b=AOHww+ZgT/b5YnX1nnxDWP1luwd9lClnlLUra9BUAdJYam7VrIdri0jqjcpHnnbYxjOk/ErIBOcWMdZRaW/3Nyk7evN0+pjXssuSiHIJvF7r66ONbXMI4p4Mp+let7Gjf3gwI8MVDFZkGvT9bSTIrbUCJmDROpio6xVkXPgLVa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932685; c=relaxed/simple;
	bh=IUZNf3fno5D/v1SQtKkJJtC39+JBzebyE7h56078Jj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpNbSoWzffp5jPnckXOhCmN0OKjFhOiRdKv+Qvc69KPAlNhM6T2Mq1wC4Lnwc2Am321JSMrllWKKuXHNGJliR1BH9VJvkCtBDlCcVT23kvdOtCvH/ehlRlNQ8GKGNUvBqDopbpMt8If0x00sfS1b5jY0QEA1tSYgZhV1DgPDPyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFg2oAmc; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFg2oAmc"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48affb828f1so2676808f8f.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 02:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932682; x=1791537482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0FcRb8OTX7/GhAedNNsxuIjIt1hP3QdH9f7yijnG/M=;
        b=IFg2oAmc4OUwqJ7/ZADZIUBWoK0A41m3vk0OoWpsiXflsnjc3loxliTcWMGrUn2P3k
         jl66KzvdUHXDElmsrvWPkxKxm0Y7f8QX2SvTJ0ZkcJF4EKD3b+1KrTWjsPCQ9DLh8pXY
         XZBRqR+Z5K0QMHfZmS9czomEFTvSmOC/A3npIALIZNAJDFVKzPfL1gaFbPLS9OlprlYx
         o8QS6yQohrVFd4J4/Dt7tPWKkEGmr5grL0Ms2ZbtwPnZtcqop93jq8s+VGo4fOicArnQ
         tE/g+pwmDzDpo9YS8Eo03Ci7mukayZKs/fKaKP8qXlpXlBDywp1x6BUknTQI+rDApggk
         mnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932682; x=1791537482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0FcRb8OTX7/GhAedNNsxuIjIt1hP3QdH9f7yijnG/M=;
        b=I1d+nWbZo6D8uouwNW7rNCzDCqYLV1h6XZSqEm2pwYYFnsJH4zh1Qh4QX6AORp2J74
         QZmRkiVcFsHUPs1W7PS94InxKfwFq+FDuHdIbBZTGmwjzRjwDjM+aK576AQwX9dMvnR4
         SVewwPlb7h4hnYzV679RzyRLG3BdZFehZh9eIrKHzZvCo9NGVMS6J7/2iDLUy5LYitdd
         Hj1NCxUJcKmt8est6+H7YVkqkm3k3y92+0uSJYjuAWCnipdELwRsemmEoEY0rVsaP62E
         v1k5cdKcEdmJnX0mY4DhawntAEyeDiW20b4YtAICdHN4ZmNu7HbqtmLD8+Ek2DGJtf1G
         MirA==
X-Forwarded-Encrypted: i=1; AKwUvBz61N4gFkHG3BRVCLMx2MqNH6Mbo/GxoAVr+NIDPhKNfP0cHNfHK9AkWOrevf2GxUuWRCNpv8jfEd9vsA==@vger.kernel.org
X-Gm-Message-State: AFuF++kyKxd6AzCXcv6B6x9PJ7/SaiCwpGFQSRO1kICkZ8NRw2yj2vFr
	jfZVz+s6HzPeZyrMcNaD9uTUNmBFbLPK4djWnNrt3fwkFkcRI6k35NP1J55wFvdJ
X-Gm-Gg: AYBFou0DV15kNfPGXAwzmm6PxK5ODcUQd19RYY6kgJ5kow8qMaVt9ilkAeBNfJhOflB
	3COb1v7uNJddc7516MYoN2RJlUGJW64n6rdQZMr89xMwgsItVfklQCTyNdA7FaN2JtZNlh08BZm
	e6ytGrNxc7LdIThfUfS0aVY3bfq2nckmzOSRkMguOLGCptm1eAAmi3w0VuRnhVyDJj98iehOZ1J
	hocx3G3IBpRhXl7Dva3LKfZArTgcIZMeaWHOEVbZRWIlzfFHHK2j3d9xqU3H3sWswR9wmKtmGRM
	DiquxjyoMeKE4Cyw35IqSLoeitYq9tMrPhiuys+T63B5EOqrmUioHSfS8fq1FFw3YDqbHieCjM4
	GGShB6txCBI4PHe6WKjcJsdG+JcuQ08I/OXDmMO1ILQDnHI4fIIDSalUEDOkaK0TM5iptrOd+YK
	7Epd2FhzFoyNBi2/8nN+CR/0AiiS0cNFRW+RpQyzpuVuUNBk9ZYmCjudHQ0pKYdZqXuYCHiVxJn
	SQj5r3tAUQ4z17ed9XBIssYrBvxvCemVgye9wRi01pBV1hAdqLYtga6fxs=
X-Received: by 2002:a05:600c:8b77:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a027564df4mr36860205e9.19.1790932682063;
        Fri, 02 Oct 2026 02:18:02 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280b2e3csm77717755e9.5.2026.10.02.02.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:18:01 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Fri,  2 Oct 2026 11:17:59 +0200
Message-ID: <20261002-media-v7-p02-andy-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar9Z1Zr-deCCQ1nx@ashevche-desk.local>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com> <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com> <ar674__4-cNOGMMy@kekkonen.localdomain> <ar9Z1Zr-deCCQ1nx@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Link trailer was invalid and has been removed.

I also corrected the disclosure to the documented form used by this tree:

  Assisted-by: LLM sparse

The clock constants in v10 use integer unit macros consistently, including
19200 * HZ_PER_KHZ for 19.2 MHz. Patch 2 now uses 24000 * HZ_PER_KHZ for the
24 MHz value as well.

With Best Regards,
Maurizio Casciano
