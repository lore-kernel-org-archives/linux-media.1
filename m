Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA9C4D2EF6
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162545; cv=none; b=spnFgOekLT5t4tU4VHi6TbXLAocCegbBMMhcJmxcl5s/3K+45RF6Yo01F//3uV9nmi9IIyKatfjpd8K8n1iL3i/QI0nnpJ8bfgc4gjJ739EAgcZFzhN5ULlAmquel0U12LaZrHPGrywhioVYeFJb2lSkXE0hGJ+5TDsQb9t6goE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162545; c=relaxed/simple;
	bh=UNmu0sI1jUnw23wJrqVSfC/9czo+4sG72RQBka6n4e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFBtMKfHcJEKIxUi6i1peI/aEfScFeIZ30hbjNKp1RFcjRlsdbV8jaUDzoVhRvwUC75cdWImPquMTqvLuprWGYxzQ6zJYabrdVQUpJkb5deMjBX5i3eflvMFqQ1S+ivYsjxWJbYEFWvV2HLHv0GW7XY3nhaVxHWrakJdmb7KpS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1lXbu96; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1lXbu96"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49e73611928so7070355e9.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162542; x=1792767342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNmu0sI1jUnw23wJrqVSfC/9czo+4sG72RQBka6n4e8=;
        b=b1lXbu960cPxffBlZYdqMpWyHHVrbGzCC17fcKlnTJO//IicDQbAyU5cTBvh3h4uOL
         5gyKisIgjOHj3pA64fg6FyqvKcrCe7tuqF+n70PQo+tRSRHrLD8HRH5scGs8ReK3/2rv
         1avFmukQfoaydAwm3zIMB3xDJu7RdbBqHPVci5kiNnvhhnlSI7Nx5wJvTV+zGoIh2mer
         TY5PxcD/sPMpzzqrwtRXJM7N9mmmQciQAFUWId4q/B2EefvihUCFJnJWFSLSNGSPLUZ+
         VwYVTusc5Yprq2MsFhEuN7TmlpsqJ50Q5QIVaGqjLQo8PBPFQNKi/5CbCr8NwTZthRz0
         xNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162542; x=1792767342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNmu0sI1jUnw23wJrqVSfC/9czo+4sG72RQBka6n4e8=;
        b=YOp3aCw/vXYWuWIYmSCHubM/zbBPA5KAeRVD3syfz2YFWPM36TZsJEltJee9CnyNHq
         2krgVObxVEfzlhp0Hap3FVgdojcs7+aCiV2+qtSGSkbXvNMaxsWbS36KYARpd0MGcqIq
         LgXi86XLVv8K/u6UHCpOO3EHEyuKrWP95V02gIR9dO13WGae65SFbH7dYDcpD0/hoTxT
         0iltW2CUKGElaPZ7XLhy3z1j1hcL1bPxelSc+VnyL0A1cvZSmMkRN9bh10hCPp7KUdE7
         Doy9mg9JUUC7JoY35zZiYamWjU6Y0wX5j9BA//QR8gkf0ElLwGmTlFyqNkHxUSQ9KM3r
         ZyzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjNjbmd/NgXdjmCW2dg7Torg5h2PhAoFRfoKDSV7MiCwOSNOnfSN7ZpPzHAfRpqXM+2G77UV8+42EWcg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJEosvXiUbb7xB3e4FEYN5NdRvRFEpKHZ1ICGrC/gTDHnH/bDpi
	1f0mKAEHHcH7nYRxpuztQwBdrNwc76BXcUTLpmbMhqwG93lLF9C4x/lS
X-Gm-Gg: AYBFou379jMoifls5iPHFoUJ/pOtCYTLqowMMwmyKSRq5nhNVST0RvwVrZHIpi7sME0
	WPAgeWCWo9kgz3YWuU9tJjDqflT8da082FMnrtqxUcGu9IQS/DCuDZJp30azanEU0C0AAsQqSLZ
	CrufyKf2OVvGzXvCbLdCG4A8H9fhIVc8d8evo7F7S+o4irTNF5EwVbDHPO6euNSt0WKIT+TFZU5
	axXX4qvTQqcLGo30DbCK2XlecSssouIVnq81dcsXekGOlDCQz9q+ke4sMlaneOPxJeTudRoEYLv
	No4CYjtMzAmj15NRwc8p6Jl8pBngJtfBcrzHr3fTlqr7TW+1QzxgpIkFFjEbAd603KbIOE6ipPD
	BVkO51+pXt54PxGFoikkJAIIJgaVNvMZy4mAsGmnhNpfQoj4LI6n9ajAzhyewFmRKR+/Z+Fgr3R
	fGvnBr0BfPltJgsytObpcRH06dMRD0SAyPir8KG3rZ4GOdwN1V5TRHkuTHH5q6b3X9VnRWCJM1o
	V2M10zIfx9XWmw4xzLCU75BzcJyLEeD0gVN1YzCwJOQbZhlJ95zWMIy1xhMrNw+CNh2hDbNe/CP
	yIG45V4=
X-Received: by 2002:a05:600c:2319:b0:4a1:877b:d4e0 with SMTP id 5b1f17b1804b1-4a1c66bdcafmr57421275e9.12.1792162542369;
        Fri, 16 Oct 2026 07:55:42 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4dddsm5644596f8f.22.2026.10.16.07.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:55:41 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Peter Marshall <pm@petermarshall.ca>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	fqwqf@fqwqf.xyz,
	Sergey Lebedev <lsa.uz@pm.me>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: vd55g1: fix VD55G0 streaming below 900 Mbps
Date: Fri, 16 Oct 2026 15:55:40 +0100
Message-ID: <20261016145540.37248-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <1a8f2064-14e3-4eb7-8e0a-0e90352aae3c@foss.st.com>
References: <20261016-vd55g0-sp11-fix-v2-1-aa08b4b8bbfc@gmail.com> <1a8f2064-14e3-4eb7-8e0a-0e90352aae3c@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Benjamin,

On 16/10/2026 12:02, Benjamin Mugnier wrote:
> We reworked the clock tree with Sergey so it may fix your issue too.
> Please test it once it hits the mailing list and we will make required
> adjustments.

Will do. When Sergey's driver is posted I will test it on the
Snapdragon Surface Pro 11 at 840 Mbps and report whether the longer
line is still needed there.

Thanks,
George
