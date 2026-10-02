Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6FF25524E
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961873; cv=none; b=MxRqQOxiuzvVveLX5BC43R/cl4uotrQewxAuq7skSCUOPhJZB8GkyBkSw6Zo6lchl1KiWlVAipg1ZLvbMTHmB+xrhpyrQ80bCSdK/ppgcMZ6U6HP+ZSoUYMCW6TqMG45NWsDtg1eiVWFD4IKV1uSMW0YFdSmwDM0tWzKbh9zjus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961873; c=relaxed/simple;
	bh=/hzSHFAg0tY3IxfWAaNBagJ3FOg+DNKGlERuwizamgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qR5lnyfoScvR7qRUJt2YZwhd0YyXKVHoObtJzsFFt7JRYK7Mywljp0f38muCpK18t8uU+QKStP+kdASyJ95RaRvEg4fpbHyiVw+j6ybBYmGBoBp/NoRPDRxKwqkoWzXJedNMpJXAObnPbHivyGfJQ+SPDHZvt2oMBeLuglPmpmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puDW9+52; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puDW9+52"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so358195e9.1
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961870; x=1791566670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/hzSHFAg0tY3IxfWAaNBagJ3FOg+DNKGlERuwizamgo=;
        b=puDW9+52E1Ix7xfkhDSSejmJKQ+6wEXz4ZQPFlNWkB3bw1F57qWOgEYCj0bHVaNx6v
         BnPKqIEnoIKqVGbARra5aprqLR4FEC050ZmVMFp1jOTwU/1M87PjMA1FbQXOmJ6eHJhT
         SuyAuvEU6zGQAmm4i3VCCU6fLcfGJXOzCn9Xm+aASAHuT5i0vY+2c0t3AWqymsYEFRy9
         L3BJdbHgV4Q3SKBiWrQ7yuXpF21TdIKiuDObMqu1b4RTMOJyHyFHhIugq60b3GK8ZyzW
         k9SXyfOqJa5w957b1ob6deWIJUuTGS8W6OMlh4TvZbO+qEyd0TsCJ8DARe7EW5DpKCNG
         1njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961870; x=1791566670;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hzSHFAg0tY3IxfWAaNBagJ3FOg+DNKGlERuwizamgo=;
        b=KgMdB3ySoy/gsPXHOhVM1IsdLbfHwvggwLNEy0pPcgWlStWNW3EPFlwIDz1eMgohAs
         vSG0bReiBT5n47QwwBCs02SFgo6jYGtSJ0JY4zs3AnEIERVkvFsgKWqhAkQQsf+GhlbV
         YCwl5HHP1ytRZHZLqiR5b/yvYqWXCuWX9jzcNQXEW5mGL6kvSyq1ERNVb1VUYWKyHeCN
         5w9wkaeiEQHFLSb/sk4MRypCWdOsvKk26MeRl+hlx8lWBPJz3l9DprQFwqRE5yrgRTtM
         fB/yY+lK9jIj3Lke2Fh7wpy+r1K7E3NXyss09MAlK6det4urv5dOGBC7apA09OrASPqR
         Nd0w==
X-Forwarded-Encrypted: i=1; AKwUvBz6vTDXwrEU0wezkhU8CjiTxJ5tHSFBvtwMIcaia9Tjb39fa0+MjEnG/u64KanX/OMjvptx9Kf7F0E1kg==@vger.kernel.org
X-Gm-Message-State: AFuF++kMMdgpiM3TApct8Oh16jhBdZfwJdX/p4/22FlCiAUJSEZFSwk7
	O0BhrqM1bskNOBHGKhehYaUO4gj/EHdn/UHXgwSB/EXzcZ4+bKTsFWP6
X-Gm-Gg: AYBFou2bUbEzYXXtkPJ20nhVTAZqfe5+3ZHhUquTz5/h3hifH0i6q1djNIJl7BsXe/K
	xvQoYIAfIQAwYG0I+jHKeDQnZ+jsknxz2eV/aw+AuZD4CucxWlFflDbj8sEwWpUIW0o3rG42ZpJ
	xRxtb6HFusWeaIRDxPizmsXEbqsb65o+5Stt6LrXJrlrbM72ony7GfshBuUjUOyHM/zK8g6M1W6
	XftSebJWPZYwvhAP4DsKsCY5gL8xmMJaMtmYQ3O0uUNXelDwpqjVkPbk/HjTOchCjynEdCtuztD
	ThTNmb8LjX+v5Bd0A9SMI4tmmaHFlQteLECyJTcBvG6h/FrAmAYmhReEMiTGrUrlOZ32U8PhRi7
	xm7z0um8XieZoVA8fyJtEYQvBfL/MZZg6oCAVzaMi1NRQk11K9i60jGmoZwR2xJuhAuUnGw+LUr
	RhH7v15oXTwKnnOWP0wmYnx+HPkdm5dqM2aPA2y185qtKT7MyihRJ9xwNJrY7qmBjmNGfmHWrpP
	7iDfw==
X-Received: by 2002:a05:600c:6387:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a168105db2mr1745665e9.33.1790961869769;
        Fri, 02 Oct 2026 10:24:29 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm7512539f8f.23.2026.10.02.10.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:24:29 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Pierre Pinon <pierre@pinon1.fr>
Cc: hansg@kernel.org,
	jason.z.chen@intel.com,
	jimmy.su@intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2] media: i2c: ov08x40: Implement get_selection
Date: Fri,  2 Oct 2026 19:24:20 +0200
Message-ID: <179096167726.2508.10599420708324219706@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002094913.28722-1-pierre@pinon1.fr>
References: <20261002094913.28722-1-pierre@pinon1.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pierre,

v2 works here on the Lenovo Yoga Slim 7x Gen 11 (2-lane, libcamera 0.7.2
simple pipeline). A 1920x1080 request selects the binned 1928x1088 mode,
which reports crop (0,120)/3872x2192 within bounds 3872x2432, and the
full-resolution stream uses 3856x2176.

Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11

> I can send a separate fix that picks the default mode according to
> mipi_lanes, if that sounds right to you.

Yes, please do. It makes no sense to default to a mode a 2-lane board
can't use.

Oleg
