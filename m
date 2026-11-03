Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691671;
	b=fTV/gtttVnZmzJ0yT04cJUoWG86uvt/B5pT943ormRc4bdHEJhhvbX3F5KzEuno6q+kS
	 LX0/ERFNEtHuJezMl1Hi0uxz0Pb387NfNxZyB6btXeJhEQRq7XW96ix2rPEOepIdXD/Q9
	 /gzTyidJkAdIKV1h7Tuz99OTaV/avF7WdSO3Lhebz0xa1QYCcBDWd5muxcKfB18Sas+QN
	 XKCiEe2FMYBe3G7yxwDCvRTYO3PY+cDFUr+ow72jymXzOveptbWDGM8W1QMwXdy/Wc+hD
	 HnLqhwt1qblWFTvQd5xaRPm3iTlycoh9xvei3q5O8aH2iu1dQm0zaDRBNWmXkcXWtvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691671;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=frMHu3ArlvkBOnWP/keZoceUz9LRRAU7jpoSl2mvnaY=;
	b=vI2jrHTKeV+AVFoGAvUKvPazMlNaA9l8DDWps51oAFz5rdZCDppXxMmyhUR/ijbx3g3G
	 jul6/60K6nJGiAkTbtmJuupdL56Dghb9fUF7UoGS287C5AEqHMQIpMgv4cUtFZhj60tnI
	 mAaSu8M5EiVy2fwARcKX9yGwhu8eLDN9Zhu9Wq3a+XoLLDcBAbYE4UCU+oIRhy3RH5wxK
	 ogouu9TAbQo66UTn37y1Kwl68lOY//d+nGUvIFtEY8AdbQuu6XMrBcAVgF7RRiineCpfn
	 0+YqvGMic1IF6udyEDI501vKtIxIRUODluVn2Wb/M/9TUYvxXzFIh8CD+tfrYcWOnNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=uyhcxzty;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F4E606A32C
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F4E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=uyhcxzty
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32DD7B2D;
	Tue,  3 Nov 2026 08:38:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691531;
	bh=2iD2OpFFxVgyeniQYanpyS5ujA1TBGPZtPUEu8qYJlk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uyhcxztyCOqtev49qyfmS+zxtgG8LC+w1bGCxNwDBgvV37iDXwvEpL9BClKKWQWf5
	 9JoZiqmk+yuEy5OChiJJZrXFVS6GrtyK/aXKVKg2mgwoTDv78kx7fVgE7HKJZSaadA
	 RL9T5VYoee3mXTYWnq9qiU4oL31Y1xp3BaIneFVM=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:37 +0000
Subject: [PATCH 01/16] media: videobuf2: Set start_streaming_called after
 it's called
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-1-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=2iD2OpFFxVgyeniQYanpyS5ujA1TBGPZtPUEu8qYJlk=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAOqeOuK8zS6V3SewhBjDn2A5tdxBAowBqhw
 ZTTb0SYn7uJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQDgAKCRDISVd6bEV1
 Ms4UD/43vAH9nzPwZLX/ijN6oVIEIckGROVUrtaYS945uE6wswPQAVGtVX0viRtIxa5mpy3sqDK
 0BF9M4qrO7MHjvGVZXr6ckltne0F+qhCm06/uyVRWZLKe4ftg0YWbWUfX1wKUepakVIAzFP1LWi
 M9ZoSuu61fD97Y8Fpb5241j2yL8v+VDKJjCW8ZgZVn8hGU6YSiUxbhKMVVPJ2Usdugwx52/P/2k
 +5OsgcbNpkzWOZ/Dm1pcUZQneynvtpzY6wEXBzg/F6kW2WO6UCas/4PQuzlnoYaUWiKey9ZPZtt
 LxEH/a6UHNX8rPN5S0KZ0lHknYuB/tmgbJYHCNuAT0pzjosLfcVJqtLmNrssjjjuo7qlv2SNk4E
 2SPrMCCRKOiFc+HiJREX+LgNxthgYXKpsTRDp1CursKRo+FJdNsS8xoznumF73y7fksGtb2iLOU
 ivlqNru/MhV0l+/07LeMWxu1gpy953ukxELRlJmh82jUK61BIPJ8Q+yH+EYPWe/NF/6zV3Qo7yz
 OoG0Q3jiabix+m7d/FLbjUwWCpLPhxS/JhVg0XPUUT6bI7suQQXELtvm7gaUT4dXr//9cylFIiZ
 Hym0AZEilzBFgxyXuAEBMlrMxbm/UTG2vbR8NxyR13EM4PM6uAfUpW4IpnPndtKKVgCdL6/mWpX
 wuW7vM39SHREB7A==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Currently videobuf2 sets start_streaming_called immediately before it
actually calls that operation in the queue's driver. We want to be
able to check in a runtime_resume callback whether a queue is already
streaming or not, but most .start_streaming() operations will call
pm_runtime_resume() themselves to guarantee that the hardware is
active. Setting start_streaming_called before it is actually called
therefore means we can't use vb2_start_streaming_called() to make
that check.

Instead, set start_streaming_called = 1 after actually calling the
operation, and only if it's successful.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b0a6084f175733ddd0d8d399538f949266c8966d..cb4b5e818553a8007d000147843778e72d3753e7 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1779,11 +1779,12 @@ static int vb2_start_streaming(struct vb2_queue *q)
 		__enqueue_in_driver(vb);
 
 	/* Tell the driver to start streaming */
-	q->start_streaming_called = 1;
 	ret = call_qop(q, start_streaming, q,
 		       atomic_read(&q->owned_by_drv_count));
-	if (!ret)
+	if (!ret) {
+		q->start_streaming_called = 1;
 		return 0;
+	}
 
 	q->start_streaming_called = 0;
 

-- 
2.43.0

