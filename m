Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E374C9558
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854792; cv=none; b=W+dpfH/JPKVUHJ9wubmpWY7q89zRHE/1Z8YqS4cZgWyB/Iq+e+eYGuy6cLfQ3p+Bk5L4xYgkmnO0TqleHNSiSf2G2W3bKz6RksjOhVX/vNJ8GfcXHZGY8GnFX3MwRUYeUQ+DeT2vY1OSB4nwnsyawWnjBxJfgqXfaBRGsnhWh1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854792; c=relaxed/simple;
	bh=AKhAEVoGO6Qib2+bHKs6sCdqjH8YE7UeUi86MuSqJIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bm5ssE0pS9H84ElWppvHea42xuhSZvU9wrR3zoGzioB2hnk2t9Dz92l7i13gOB2n+eMyfkb4ZXPko4zckst5I36CAn49Aq7ziK6hQFp9Xyv/TEPkBM2lgkz+G5bE7E8byOyS1ckT8hUsXpkwiSvSKyhZ7WHxQ5Bq4JbIf+a41Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSq+dWxS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSq+dWxS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso505475e9.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 11:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854789; x=1788459589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKhAEVoGO6Qib2+bHKs6sCdqjH8YE7UeUi86MuSqJIM=;
        b=iSq+dWxSDpmbLWpinfGMZDTYCpZerdRNe9k+yHS/MGWUuxtjl5pi21qNKCNXmk0LUL
         TUoCdQIbJbSSZ7yJ1DbchhERgCuP7aYZ0D+RhLi9wt0fVcjv56eTqh2p3AyXfD0f3qCm
         b5cKy87m67A0D/dUHlka76w8YZ8Gs3P7orpIOuYG2qJUHtdL0EMadBrvC6oMt3TmSHTF
         8McKTqkhkEtZlm1fSXOGPqW+grDZMmru+B4GazfDVpwrbrvw0ITRUX0U65VyujUXB8KE
         +FCB/gc2aYxcAkllEw82UMP1HRe4dJFhE42jrVV0nrYQlfuIiIEiVbliDvRu8snFNKhH
         0rfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854789; x=1788459589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKhAEVoGO6Qib2+bHKs6sCdqjH8YE7UeUi86MuSqJIM=;
        b=tBF12kjZeUYaDnSyNYC1BgObMIjfsE575Ua3JrHVSP/BpppY8ymhPCjkNfcX+GsIY6
         PPCRAZuMFkAM7xBxkcFssJ5das5S9F/7kPjKiCHpBed6CeD4xtgaShEBYxy3enVCFx4b
         nYxPwI+4frcKMpwMADCLLpoRyWQsrNvzm3ZuNAHRr/qRkmoiubhUWZxj9oYPNQcT88wR
         bDh03wlC/AjF6J0KodnA6WZcSHKv7SFYwBtpdC3U5xKLrz8/KarAkOpmfNunNFMYFQkv
         OQjavpvqgRzdpr7DC3NH4+rEvjEqwb/Se+Jo1rbIo+Z/2JaH/Oh5JHEeQN/eVC67cxar
         z6jg==
X-Gm-Message-State: AFuF++m/pmCYNsBrS64inlydo0RTcDabz4QnPHMY0yQ6uajzFCSd5ZPT
	MbU3UFUiSSNKF1eN0hV9S3MMzsW3tJmg6Pk29G69JxcUsMgg44//kTkf
X-Gm-Gg: AR+sD115509bqxyAzSKVWC3WaPhLvFgTDDZiJ+HGtuGgCdcwjfr6uCTibMnkYinYjDm
	bUUb02/o84iOLoxHhFZdw1zVZLFW++0Q10J6hJ/z0LfjSFHM0FvAUM/LkW1ah299UPUJJtux9zx
	DVoUw7morrR4VGPES0rKzE3F2aPYoLYCewY0B3+DH0RGaVPArOmpAZ1He9D3A5e5tk0ifIofNmQ
	Ia5Gtwxhqv/qc85nM8+zepth/CfPKDLFY4STKEs7ijylqS9rX/261mpzJDN0AUOMfLoMTDx+meK
	KcRe5sYLlUygnZbRVzBlFgmoqGILRpRjjC/wSTkJH75jyLHyoJB/4/sHinonFAifK8ByQyNI6se
	WH9IRSQvsRCaN4KvZyUZP+YwRj3zb8Kz5IzJ94vOTAV31gTRx0nauSURpwWmHBfPJz7s5GQ8EuS
	2J04hOUAr/mdtOvf53OLFWSufx12NAko8B2COAE8Q4xUd5yP8NdF/FHMoXwpEDIPqOoRsA/ZfgX
	kpRlSJJRgKWwf8aOMSUf8VEJqqA3qnjq4fXYvY/8f02
X-Received: by 2002:a05:600c:3b28:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-49b91c56cdemr12076895e9.14.1787854789174;
        Thu, 27 Aug 2026 11:19:49 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm3721015e9.0.2026.08.27.11.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:19:48 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 8/8] media: i2c: Add WV517S lens actuator driver
Date: Thu, 27 Aug 2026 20:19:45 +0200
Message-ID: <20260827181946.2432907-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAt5fsysjAjU38q@kekkonen.localdomain>
References: <apAt5fsysjAjU38q@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you. I addressed these points in v2.

The driver now records both Intel's 2014 copyright and my 2026 copyright for
the new V4L2/regmap implementation. Board-specific text was removed from the
Kconfig help and driver comment. Register access uses regmap,
pm_runtime_get_if_active() errors are propagated, and controls are restored
through the control handler after resume.

Maurizio
