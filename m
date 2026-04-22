Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B043E8C75
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776862289; cv=none; b=icb1Vv4GoAU74/kF16tPd5IYax6m3sX/D0ZmuKF+xnUIHrMB44bbVdFIeVPtgWLcALzXRMkWDmWVDhwiAc6evpzJM2nZ7yXUaCsgSHghmWE/PKzZ9B+ft6Fyv0K2dtmDM6OMPIFnqpTEQjzperiADB0uScxkk9zPjzX85anPYkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776862289; c=relaxed/simple;
	bh=Oza2kwXNIpSn5CN9D2qAS13wqdmSFu8jzy+JgUjkcJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9PBp325jLPAuYGaVVxllV/2oIfoz74OrF+ZGQ61UujPsLz5/yRlWeFnBs0+HJHFcRYQxXdhilsUkKDd4qed5qQWU/WGvVPBE61B1JKknmOfAoVsHYLNznQAyaDIz4xPpr13rMXyOJxsflOVW8+lGggT13mwWnjum9YKYLtBUgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7dEl0aP; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7dEl0aP"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35fb0bb27e7so3459982a91.1
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776862287; x=1777467087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oza2kwXNIpSn5CN9D2qAS13wqdmSFu8jzy+JgUjkcJU=;
        b=e7dEl0aPMiXBczh1/PmQiHV83KzSZXXvE8MocqW35Z6GgrN5/A3JsvzEJG64Fopx6H
         VIf+DwkwaLIIAqB6ebnMzJiwgL1PrSGGbRoiW9cJyRxMjqhFjJRbTC0oiKadjEWqenAZ
         GfUb1jLgLWQRbV27Nwfs4cLAWmJ6cSGWMrFu9rChisG9vg46alVBpAY53K3IyzuVa0n9
         +R7SxhD6E0nBTwRQEtIowvC7mJq0NclrnuvW12FBXvcNimmShqnwIqNNYYL6C6Oy9hqH
         OFwqzyN40EYny0BmgjXU0tEWeBUlj0jchvLv6aFmbjpmx9u6S74TS9/w5R7S6HPV0GfO
         q79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776862287; x=1777467087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oza2kwXNIpSn5CN9D2qAS13wqdmSFu8jzy+JgUjkcJU=;
        b=XUFrgjiPRTiLzEdA057rgqQgwBZu/Cr16vsEbMzVcb3OTjy0GgnWR+SjzFbOVJEhJw
         s1B6Z/PgAMBX1XB1DQeSLDpWUxtBo9ZHdfEmpU5nJvtV3Q2ntZgAHG+OENSuySMVaWQS
         /uK7xvhwRM1mjCN/ltukVYoPA+D4isNnH4xUD+e41GtjcyA1dQm56kHBaTTW1RhpM5tg
         zL7euEkL+7A42lsitn3+7rRb8/klPUim5wpATtYG5ZW9qqj6U1KZrRN8nEcR8jXWYxUU
         bO178rxNFSgIYsBdgEeLcQky2/gR0rSAkigFCdvYO5gxCPbJwHUL4DtktBniMOkcPvWe
         VgQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gblTMrsYeM2sxwHPugeLiyBCTgS+coeMMz65H52CIARL8MliRFSDtKIzAfa5AiM5a/M+q5htBF+OaXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/5hDtckITvUgjEBjkNld40kYkPNgKahBvjYTb63V2VtkGOsWe
	+nUT0m6+P9etE5s5X6WLm51wOGgKxtbjAcuTDqTHMwpu33N7DVWHqjJt
X-Gm-Gg: AeBDiesWQJwddCJ4vCECp+mtchVUkmSLZ0sbKTJUsMPJHSC9zQQNp77qwjHQoxcsHfe
	/Oyn/nv6aUdyN7EJL7Xy7TM4mT+R904latcV4VPKRVgY1MWjGMAmwtDVgPrAYGASoPeDv+n9K+H
	PkoMMHuAF+5r+hGiaSHVm3/zvTjc/J/BKmUUuWZu4XZOgBF13EG7Ld9dj1E75hMjbPc/cBeVRoM
	vmH4w4ouoO6ZzxuGeZ9P7r6Fao4LUeG9cUzy/XEdtn0vTDaRptBPjmu4hPBRKw9Xp/vGju8P5t0
	QYOm+DgYiJT+4cFelNSCzgSQPjoCsQlNwY7YgFKt8FhM/FYZxXowP6wZ0pD++/aBoIW067X4kGh
	57w3ZFGiOzl0kBMB6EZ3tbw7woVoPq655g130IrlPDKrIoz390k/LQ3EF/y6oZM01rJNE8x0I8a
	T7kWkb9+T6E5p306CxIaWPUfUKyM4P5kNkWhNWM3uGwB9q/ccdf3OF
X-Received: by 2002:a17:90b:5845:b0:35f:c46f:2b0 with SMTP id 98e67ed59e1d1-36140473f70mr23188658a91.14.1776862287451;
        Wed, 22 Apr 2026 05:51:27 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141869e88sm16671011a91.1.2026.04.22.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:51:27 -0700 (PDT)
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
Date: Wed, 22 Apr 2026 18:21:15 +0530
Message-ID: <20260422125115.39219-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aejBTB7JUYb43Fqi@kekkonen.localdomain>
References: <aejBTB7JUYb43Fqi@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disregard my last reply, apologies for my mistake on the subject.

On Wed, 22 Apr 2026 15:38:36 +0300, Sakari Ailus wrote:
> This won't apply to my atomisp branch.

I see the issue, it's because of the indentation problem that happened becuase of my IDE.
Should i send a patch v5 with the indentation fixed right now?

Regards,
Debjeet

