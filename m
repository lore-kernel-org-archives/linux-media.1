Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448413;
	b=rIxopFi+gkjLZX1sfcH73PqQCrMjXqWp9m+xh5auiNo1fjpx+jRi0BvIfcn3wKsFCl/p
	 JtubwrF6K7Akuc1jeyrT8kfrJIq1NEFNi4eKGc2MvbX+WTq1qdFbsQjzpKqQI4kCtNWiA
	 c+hcr5SjFNvjFjxqsOijyk83D4/2C84qst4Op90SutJxPJUSrBxCv/PT+ps731dePRYg8
	 6poGJSPia8IKv/mQnIY4f7/6w3CCg6C4iZcphZ6XGZ7MA93VUgi9YuVzLHsgZ+/z93QSw
	 XRCQ/jXwyq5l/wOF0aO116FXI2nP5SkN1VjJ9F5p5RPeolxpv0gjoZaWns79R5Ip9Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hPklCA6iPSfMecleTfh/hEh9Vrxq/JnkDe6aLo0pdFI=;
	b=nfr9ku+bLZqzT3FtMSz5LX/uV9tvd/trW+Z80YohNPUz0+4G+HULhzpmV1mfyhNUuXeY
	 FOqaqDsqW8MlW8EsnSJzg/8zJzN8aBBdmb3bSZlpq5Cb3o4lgxBPXetRP1awGaHHTIhuU
	 KgsIUCldsHqZIcrpziAu0eJpKQN4JuWUVvvghjokC3VXWWcKbDIix2S3+EweeJzXVMsEw
	 XWyn7QEHuO4MTlDwVxZc4X+wvSKGJlFkrjSLFbBYdFNIBiyAaoQ98VlrruvuZeTG5lEDi
	 74GkCj5OHI4WZZe/Z8Npl1kxE3iCZy88tJCfaIGfTSlnc+oeYWSHTW3i+eVP6rWCGXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lh8nLdxa;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA5460A5BC3
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA5460A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lh8nLdxa
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so5753704c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448412; x=1796053212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPklCA6iPSfMecleTfh/hEh9Vrxq/JnkDe6aLo0pdFI=;
        b=lh8nLdxaaz5IPSaPxBgKthGrYFF+g07VR5Xbe8JOogSuTG9I91qcwvzqF3gHVDohGW
         8fzq93MogKOG9LrnRLKPLvA25ZTCz+IZ7nsCycngBlhOrYqmSHxc5RgXwVJ3QAKQ9m15
         XE32ME2GqMNnS8rOqZtV1jv28+/8f4dY2ESbFK3Dwcfd3JPqgDDC4PE3PiMajKYPEUHn
         GaCWPyIztklySfwyG4iSaUfopPkyFNlpFeHbG8fI39CNBfAwCrO5zlVHMbhjzT+PBBhU
         YU8KnCIviJisPYt19Ihaqk2cAI+emls03ofGD93ZNTSEvARnF7XKh3llza+/ULcluthx
         /gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448412; x=1796053212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPklCA6iPSfMecleTfh/hEh9Vrxq/JnkDe6aLo0pdFI=;
        b=gh0/OfAk6ovWR07XIWCz3z+X6aY7mIh4lhspl8Z2n0VAHtm288xLStLHy+lZvXC5GF
         Hdtrgiqg/Ku6DxWXDV6HAdncgqhuNz9bUAH2HZHFH1n7Ywg/OlSDEPpdOWFZePzcw9Tj
         rwHKGeCRGOZDsJ5D1ZVvXVIbFmnWE/A501v75VBi+8/z8SBAToN827qL2Exsj12Ws5/D
         kzmqNfcnWGzpNAk8bMGTWVEYDLCFI8ICpg7qn/wULryoUN0W+QabvqOWdy0xy5NkwJMt
         l9kpJmDI8GptPC+9yLAlptEQCElz/nrHC70GXJ0w2r/KEvmTX+bEf1x4A/Q54tIJt3Th
         Y+vA==
X-Gm-Message-State: APuU4Z8HcvMUb/xaJsZkb1ByQHERWpBaXC7A+Kaia0EAec3b28dftJ7z
	831Gkx6wAWQqLY3OG5jqQ8/UIPFK9JvkkyfcAJLG3vTRzvpMh1q/qMYv
X-Gm-Gg: AZFdTZf7cvYaTnw79tBqDAhBQVjhoqynRfyq3Fx0vKge6ONDS+VeCurYb3RKkhWRlFV
	7oUSYGTVa+084CkTil75Lxa9w1QMMqIzjftpd058DH8oA847U15G1u9R4Y5e+rZE6ygpckolMM6
	R8OBzFbslhNY5BOBwpfexYNYRloUSn+4vgO9hwmpWUy/UnyJOQ1w9K1rKfDetX2SCT32uGd1TAP
	gpmLNCUbKCNZnalJDPB3trDC45ZEDiuQh5LnSskgT8VMic9mEmwcXi/mPbeay3xtjkTKEylfdZ2
	hur3z5BFZUrZh8Vdvvgx5sbVNbkq3A9MRkwmv5uecq08SWkQIR7ZBVX77AU73Vm5JSEYEuEeXaq
	JS2hRGvNei3ApkNu0KE/bhUmbAW57UVD6R7QAyOpBzTuAty/zcpvycCdKmBnOkPPyHiCOxjq3es
	BrM3dDUPfVwdp3idRlALGZ+m/FyazfSGHs2mkDOgm2yUwqmzgUwGHjp7oI5t2zZw0DiPsI/6FPx
	Q5S929oUddYm83oBebTl8gsihr511OrQujEIT7YMHzVFUM3NlfzTmlbq2Tu6o5Kfy6SYRuavwM0
	8kmTYL/J8PdIpKHyexC5BQP+arZGC/hFLb2P1CFm2DRRb18=
X-Received: by 2002:a05:701b:4516:10b0:1b1:251f:d732 with SMTP id a92af1059eb24-1b5568e1e20mr12125028c88.31.1795448411933;
        Mon, 23 Nov 2026 07:40:11 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:11 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marek Vasut <marex@denx.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/16] media: i2c: isl7998x: power down the decoder on remove
Date: Mon, 23 Nov 2026 22:39:25 +0700
Message-Id: <20261123153927.2547169-15-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isl7998x_pre_streamon() takes a runtime PM reference with
pm_runtime_resume_and_get(), which isl7998x_post_streamoff() drops.
isl7998x_remove() only calls pm_runtime_disable(), which does not run
the runtime suspend callback, so a device that is still runtime active
when the driver is unbound can be left with its power-down GPIO deasserted.

After disabling runtime PM, call isl7998x_runtime_suspend() if the
device is not runtime suspended, and set the runtime PM status to
suspended.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 51ef2be546e2 ("media: i2c: isl7998x: Add driver for Intersil ISL7998x")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/isl7998x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index 42387bd310fb..48fb131c9e45 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1597,6 +1597,10 @@ static void isl7998x_remove(struct i2c_client *client)
 	struct isl7998x *isl7998x = i2c_to_isl7998x(client);
 
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		isl7998x_runtime_suspend(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 	v4l2_async_unregister_subdev(&isl7998x->subdev);
 	isl7998x_remove_controls(isl7998x);
 	media_entity_cleanup(&isl7998x->subdev.entity);
-- 
2.25.1

