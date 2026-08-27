Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6AC3E1CF4
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872716; cv=none; b=RGt1tOWLrkMNdkaoBnwD/0t8/ovxPl+Ry0k8y7RJDdvQmh8bKbHM70+IZM2ZvbXYka1X0H5TVrASqHHTFQig2HFRkSQoI3sCAHcXOJY8U7PpgG0U2kukRubMZu8iAdOn3n4B650/AKy02j03yRhCYWuYcEZ4lm4pNFmFnN38IW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872716; c=relaxed/simple;
	bh=ZTtwMkpLOSZu+3YbiwWlIQkrGYDyVLn8Y+fql8iKjic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDBTqMBq2SrB+0NAEDdkncurSrN6w57htMajGSI4LdKALFD7fmhmhiFR2a2FXDO9BrF8QVDW5I/AK3JcN+j8vokIaCjtcWcYzf/FdYFb+5i9C+NSDrFcfdQfIkP3MemKT1XYC6VQKnqYcpJ8ZjFuKrvH1NAMh63x9omNGEJrzv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+OkjAsN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+OkjAsN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4957eefd361so2347535e9.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872714; x=1788477514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGAnNojWnd7EEdnWQq2YtB4nZzTR62jm7SPRm9eXTaE=;
        b=T+OkjAsNpFs1WVWgUUTz2tH8mop5bNqn2wIeScW865nhc2o2LPtqHiUK7JirG8guBj
         3mMpz1w1fJiiSm2V+jATzw6keh8wExUshM/GUZKxJWvltCpslDtPoBiNEOaHLlWO0W9k
         5+qiqecba2RW9b1SoxYUtVJAFyw64sFtjqefTwZuDANzzFJ0GzT/PlXZtDQUagQUurPY
         QrvEIeb7Ne5N3xZRt3S4eSP/0hccrGJE08JzbkclHoKMOiR8+EZQy7vxlnIWWymhwg48
         JmsyvWW4zADXR0ODgk5dR1puFNa0xxG2pmAbP2e9afHxs2gFReVyHSlj1+IUAoObmVK0
         uhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872714; x=1788477514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGAnNojWnd7EEdnWQq2YtB4nZzTR62jm7SPRm9eXTaE=;
        b=QqRRdS5ampZIO+HHwZZyNNTBmh8Af73PYDNExpMONe3Abwc1iTQCLfbwLWJF+TVMaJ
         4cMP6KFv9QF8liKRp0fvsS8ZAOoZZqg/0p++6CO/nu//M8o8vkJpkXwwe3uvNSidt9Jt
         7T4faVy13LKnsvw5rZyAbZWRigKQzLfP7BMUg55m+3L7fw0iV8c+2D6sLXwLRrZnLYbd
         QndEb16npWDoHsJss5nsoFwI1r1gmi6hutRhSRh96maeb5cXU2Bf+azY9PRbrObhuix9
         ByWQIIsVIa5u1t3E0AQ8CF9TcCOR8lATmwvmNepBncQgaO6J6Vwi4ypSBP2NNaow/5cI
         0OYg==
X-Forwarded-Encrypted: i=1; AHgh+RqUVhca4qJw0iTmKQAcDbtVtkT79ktJ721CwYY2vscFUvaqRNFrAdL0SWwJ76veFA3rLF/BfeT/xwe4lA==@vger.kernel.org
X-Gm-Message-State: AFuF++kXsZUjRJ8XX/kk8XryZzxnwSjVppoo7upSOqtAGFwsOzS19eOo
	34dCu+R7TXZyHrl/CyArML75kdUzqlsSsPrQjGvKi7RntECNvSsHOTSD
X-Gm-Gg: AR+sD13ivQs8fxoHN53RM6XCAMWeGK9yXLShKisKUH/o3VDHO/4mQw2IEGxmA20u17T
	wRaU+XdAq5atufUlv8wNf2oHeH/zOM5YNXCyqbWrjMG4E5DE40ZKqQe7bQ/uvBc1yAa7YEiEkK1
	Sr9teQYBd22AbmNHTobtaqcVoQHs6zhl6GbFOO9JrrdyTkuG7Hn4LU5x+ZN3dfHH+lj6GcuhjwA
	MP/7yI1UZkLoJUkITecIZwfLUH6AU0hZMs+aTT2jmwNmc+59QNCZnTWEPu5kdiXzxqozS8fERwe
	I0xFT9nf/fnkqrQn9DQiTunClYgQlaHGAGgzrPQtlQvwNQs20DfWSrOTwYUbWqqtU20kpGz1mLQ
	TcC24PVfR4vj9A67ppukGYV70HaXA5YiTTyVl5dKB73KfE78wlDrHGfddurPgHlLWV8+xPyLs2N
	bgQLUYwxS6359V/YTanrOdZ2jaJ2Qn2pajUGux3SFVzeVROcDAwCNcuxrx1MkgW81CgmUemtYC1
	oxZt3ugh03QdPqJTO8TXG8UhmII6Tm+WRvotAX40ddz
X-Received: by 2002:a05:600c:a02:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-49b91c52579mr25104815e9.14.1787872713803;
        Thu, 27 Aug 2026 16:18:33 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4e2c1af7sm85413445e9.15.2026.08.27.16.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:18:33 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] media: atomisp: support the Yoga Book OV2740 link
Date: Fri, 28 Aug 2026 01:18:30 +0200
Message-ID: <yogabook-media-ov2740-pahole-20260828.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apBJHHhAPowUs8Kj@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com> <20260826132256.3343451-6-mauriziocasciano7@gmail.com> <apBJHHhAPowUs8Kj@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

I checked the final v3 object with pahole after moving code before the two
register-list members. The resulting layout is:

    struct ov2740_mode {
        u32 width;                              /*  0  4 */
        u32 height;                             /*  4  4 */
        u32 hts;                                /*  8  4 */
        u32 vts_def;                            /* 12  4 */
        u32 vts_min;                            /* 16  4 */
        u32 vts_max;                            /* 20  4 */
        u32 link_freq_index;                    /* 24  4 */
        u32 code;                               /* 28  4 */
        const struct ov2740_reg_list init_reg_list; /* 32 16 */
        const struct ov2740_reg_list reg_list;      /* 48 16 */

        /* size: 64, cachelines: 1, members: 10 */
    };

There are no holes or padding. This layout is included in the v3 series
sent as a fresh thread.

With Best Regards,
Maurizio Casciano
