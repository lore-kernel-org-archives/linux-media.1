Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7233B27F3
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366563; cv=none; b=Xsx3eog5+CdxQe9t7F9xua2T6d/0ByLhPnG7keRdhoMu/JkEqbu+Xgm77QG8sAwgxNnf6nJI5c+zrWGSkAf65VHNywoO0S43EfG+ufNHI9UgOMAUh6L2LXR4kB20UuJqV2F+OL3SGXqC2eafB5ExFefSeT1SikfDTShoeRfa2GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366563; c=relaxed/simple;
	bh=fH/v0xQwVL8zAl8eE3jm1Pxc6yiD7bQawrdos1k8S/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzDJW/kSBlCObZx0iqJ3d3t4d0oWvPsV++GFqnwioBf5BhTL44FwwRpECn0ymXnjfEKr4KuB8dzJwXWAQdlx804Xozh0lKz44QEO6adJRi2dPybYue3gRZVi817TXklNltvCXTpKDeugsn2tjEALoQ6M91yvMr14oXSCkzCQl4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZL8YUY7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZL8YUY7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso13597015e9.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 13:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790366560; x=1790971360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fH/v0xQwVL8zAl8eE3jm1Pxc6yiD7bQawrdos1k8S/4=;
        b=ZZL8YUY7cE/Q1bL3JIJA2gll/9AL2xJwPx5aYDtxYgFQezHmUeXpQWAsuMkRyNfWkS
         yBpo45ZCUItUwwnj8hF4Qw0UgCsAwjVX+qkzEG8JWbDP3Z9UcpHGxQ64+X50MAXSL2xK
         Kdk311uvKQRGIsNdQaBpaBOeDBgP5dn4PahwYas6pT4JsZJESAn9xT2HSWCaKd1GYL3O
         hTM/5/PziFQmq7T7jlDlMFI8lsS/ZneLulEuwfYRt+4N/QU3NOu5U4kawwZhxdT8w85C
         5jiXN2UrU3SnxFMHiZOKyv/hpavRyDAKtz8LsgEnxcg/kShec1L2Bbupd7LGIuPY4H0o
         2/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790366560; x=1790971360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fH/v0xQwVL8zAl8eE3jm1Pxc6yiD7bQawrdos1k8S/4=;
        b=RYmG52Ciw4KismjIQz7a9LgLXsi97NLIZx9n40bgENPIC//zKtRtxXBz3li/2g9Fd8
         uT3A/ho1yy2kF6AyZ5D4iez1mVQEc1w4Ze0a6tzNrWtHo4TmI0ML8zO1+YumEEuIpYPg
         YJVRip0jqJe8wsJdls3nNBl1j48+nc3qZWRv5XCYNCYv//+lDZuK4tzzruCZcREavhbH
         OVGRXTVYz52rWL1WxdyhghiFVIcZ404cr9kpYqtKDvjQwhE+bymOd1bTGIBcdBUOUBq+
         VJyG0M57C3AIAsgDOGRXg0pC0CjwcRgiLkIyEonBRa4HqlgXyjy33lAtTodEfVXuJFDd
         KBZw==
X-Forwarded-Encrypted: i=1; AKwUvBz9A/3vuVN3OCl43E+25BB1C6d+FYc3HBMgT1E36hhqqfb6A52FoHwB8GUU538OEbx/m8k7fAsmQaoBYA==@vger.kernel.org
X-Gm-Message-State: AFuF++m/SY2y8NBDbggRhBl7MFJfLWNNnK1xxsgAab/XSzI9MLr9CjlY
	as6RgMsaLJezNxOh8/YFkPJrUP5YvIQZyCa9UQPTjUSiqPcOkF1foxEQ
X-Gm-Gg: AYBFou01kDn92uDAJPEawNU1DWqaM75f1TAsApVSzb4pjK2RPPwwmRpHzqPLJojlBLV
	f2sIQSRlecW8eVE5tkzVimL0mSmkR3GhDBtsW8H6GYDeKJ0nHSEEUTqFehSeS9R52hWV5K6w1Ji
	/1Z/f2dvUOu+rsTn6V7pD8NC482LwePX1kKEmF2bmNbpFBVlSyVcAYRmSd2O6F23mWF5dJjd+/1
	ziFf3rHwlb6V06IEvP269EmtnpDe+nx+SUfqxug4U9eex84dmsE4Lhk+3sqlRTaw2EK/QmYlHG9
	82o/TTgtklnApE15S1sPdrxxjWKWsIdHnoJqyHhMi+Yf7XjkDhMryi0PgEWg1elRVc13wmgl+JY
	S9Pwkcs3dPoewnCZMcNLLzJSQ9JyKskQCmGK7N5jfV+ZU3HKPMW1ZTo2+DNqQDAjfXmuKDw0dpc
	98zQG4LLN8hrD3lyAWk2MisJ2eAB+tcU6Z0b6EkgcojBgIn7p8QDSf2VYwcrL05iLMDXpF4TvhF
	Rg6nowh4rXfTGTzNX8abY7LENrzY2LsUeEUTu1ZsqthnlneQmTYh+6mL2cQ+693
X-Received: by 2002:a05:600c:46cb:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49fe7b52f06mr110563725e9.2.1790366559601;
        Fri, 25 Sep 2026 13:02:39 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff285550asm51693255e9.3.2026.09.25.13.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:02:39 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	sashiko-bot@kernel.org
Subject: Compilation error in [PATCH v7 0/3] Add support for the Sony IMX681 camera sensor
Date: Fri, 25 Sep 2026 22:02:38 +0200
Message-ID: <20260925200238.12765-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923211816.89954-1-lsa.uz@pm.me>
References: <20260923211816.89954-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For this patches i used Cachy os with the kernel 7.3-rc4 both for compilation and applying the patches

After applying this set of patches, a make error popped up every time this patches where used, after testing i isolated the problem to the 2/3 patch, this problem seems also present in v4, v5, v6, v7 and other camera-related patches as https://lore.kernel.org/linux-media/20260918221705.323510-1-pm@petermarshall.ca/ that adds support for an IR camera

I do not know the cause of the problem and may be fixed in the future, until then, i wont be able to test this drivers
