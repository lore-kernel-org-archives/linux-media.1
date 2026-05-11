Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B843BD642
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490695; cv=none; b=jcX4XQn7f4eWTxvqiBSQyv1jUmVETGONvpBuayMMyqx8ZOhaa90d3iKaPckWSEDMI6GpiziPkcoCjXfdXYbDi+Bi2YYq4gfMRrK/Ry6O3Ns70XY9egFei2Tf93gE0ICanrhbOByzq8qTHdXkfJxekoTghW5JRabEkrFPA/zjfSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490695; c=relaxed/simple;
	bh=2Fbe+51I+NHaqoJEm/Ia1P/RkOrsQ8sOHQ84+D4jX5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NRhXaTq+Lq+CX2GmOdaAY47j84k8FZqEMxhOpnJM0nQo1sJr6PlYjPhaCcq9AIYjhIS6Q774jYinR4Jb5ASSPUZ1nwPsQEoEVdTn/8UOrhA+prkiZDq5CTyoy4ZpZZhIal+JAq+xO4oWZE5fPzNCYduBUj1m2wRu9rZ9MVFqnUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOXjKgBI; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOXjKgBI"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so1595741a12.0
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490693; x=1779095493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=fOXjKgBIrUxxlZjeFfSpBfmeSr06lnAC4d5lOm/VuJBSZ+DfFbQ28rGcumpRJya7Aq
         Ep+DOmMcJgQ201ciw8u4WJHAknq3991Ef2eH4bUeeYHI5bQ4CeyFxgoq61PzvpKeY11U
         OrZxA2SefhJw8MynFVzCKWYpCV/cDmjEsfdCvf9SWYXJ+UIfu0+wde4VMaw298nk/vj9
         Zctmjl6kDX68Gt4RKKS/ybYK96T7sv5ElZ3wazkUfYCrwr5vFACA79BzlQnC//9pAUVs
         RuTNy/QyZ5dOPdB+yqJLMBNBYfYUEnnWtKiS+qZ6zvLNPRF3mKugYMLbqOlMQAVUGx+P
         3a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490693; x=1779095493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=lxBNnw4v/Z/qSi9wJEApOxKjfSVoqwk9iu9PiR5etD788GzIHjTofGdgAISJ77FNDj
         2RE2cu3Qwloxa6DqeXr9qZoodmo68xuDBWtprhViao4RF4BrtbMJ2KpqSh4VyDf2Shn7
         aDVFC3eWRfdHEaJ0D+mUvg4HHxMJZ4W0EX4nmNLCjDzeL3k0zAqLtD/XKEGUvLZzVfN6
         OauY++mcWSm3kOalFSrMLWxrNzIeHlgfVx4s/11Xhcndfn9OrPjzaR8rRqCSv3nIq9Yd
         SPahN1BN8MZsYIuf1lgU7n8BYRQltaBk5BHNSCLm9ptE2iZ2mF9BwAXHIgKsiNWD9btH
         Tkug==
X-Forwarded-Encrypted: i=1; AFNElJ8CuY1IOIytltXfY1YBLXGCWhaJnoBFOrTVdysfV6ofx6jW7pGg8TCzCuBAsTdY4Kj3XrYqFiOsOcJPAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJeB0AJeDeZDqDpOnjRcjH+E3Q+ucVYeejAJzVThxq+snGDPtv
	dYyev4ZbDdBFo16Uuzcp9EmOa4uCBAgcCyq0zutQwoI9HxMLCcCrzKg1
X-Gm-Gg: Acq92OFZfUtIJolLe69Cvh2+lig1/u56l1e6yxcb5/65pc4qTjpHBjb6kCO8x+ZtDGv
	rOwvPLLez3XGTXkR3nsf+KIoNmvZA0yWC893V2LLWB49MC6H5vwABjTuhNOZnbyC+ExpVVXGSOr
	nnduEq3wad47sKSOPpJmQSX/ki+JhGpMaYoULsqonb8ElOJBmtc/BN/Z1Qn+d1KNT3Qiibs4dfS
	fFcDJB7YlORLfIySZyRaewGyifUrXvoJUeH1DCxwqfCUKp1H9X2Q7DpJIygG7A2du3kvt4ljTF0
	z34WkltJEa/8YkcyBUJSQmkKxxjaWM++aoiqrgLPbBpuFEDLQjjZNFfp96Np6Rb5+HVNyP6Fk97
	ruWWvvwkV7OWVhlNYwy96D2+JH+kobxJseMRockutlXsPg29P9rO1Vxl1uli0vgV9oCpeMtZ/sA
	Wk8zFMnkouKc2IyXTcT76kI6c=
X-Received: by 2002:a05:6a20:3ca5:b0:3a1:d516:36ec with SMTP id adf61e73a8af0-3aa5ad31592mr26172526637.56.1778490692746;
        Mon, 11 May 2026 02:11:32 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:32 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 1/5] media: hi846: fix hi846_write_reg_16 handling
Date: Mon, 11 May 2026 17:09:20 +0800
Message-ID: <20260511090924.269106-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511090924.269106-1-mitltlatltl@gmail.com>
References: <20260511090924.269106-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0

