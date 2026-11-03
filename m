Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691673;
	b=nYWXKcrUFLG4srGlaEawjLoL7JlFXtNOiJmR2k7xN7VwAxhSBi9TGqQfFaCbPwxeS5/P
	 13aemfwXIFabSd6AnUo4Hh5XY007N6RZ4qEUif6qKybpf/8FewXLbcDjssWjc8lbZ9u3Y
	 NnZ9rpHWRdNIXZfWkqyv9VIjiieWRSovxhoWiGXHdbq2BgPZP6vNIb/50AoLScK4T7tLO
	 8OvUALUteEu4bQGxqwrgHG7m1ils5DgmNFjnHlX3pu8lJ44FF0Q0P3kHSV7pr3bM/7yD+
	 AzvqEqv0o9aGFBcChSuLc5xO60RUtvjSVUwF5aNp9Cgf9bRcCTMbwV8gutpBwACSYUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691673;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cegzHKtXxs0Lc4YpDLjQwTWbzjWCMJ7XMQTBaeyNQVc=;
	b=hayMluw8RaWSAYZP8FEcPWzHFm5e3goW9G+9IRL2vEGmld5R7X7PlcaQI9bySZIJTied
	 roqWe1tGxp+LMJ6deFt0bk84jIRlt120w+r5uQw224s5ojKtIglvcv951dE7TVABG46Uj
	 gqXdH+Nc7Y1IuTJLrFznumibXv18L4sh7B4slmWV061uVW7zItfT9FhbNn+9XCPhTP4NG
	 FfcoJBLi3bVeHSCvizqYWkbQvwgP+On3sNkcW0zY9ntgT9QDv+ZO6LGnT+ems4fBHJGaI
	 ktCDLfJrlxqq0R2YHf5eaO0hJj0zQw756OCg5Aw61mvTY3xeyyr7Vetg5NYtP8VHAIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=gzbB9OU5;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC6606A336
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AAC6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=gzbB9OU5
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9EA282A;
	Tue,  3 Nov 2026 08:38:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691532;
	bh=ASCHccvtgsXkln1Yc03LRzPTWgj56l6pbfoHKx4UZOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gzbB9OU5LGs6TjIKOl17ybSw4RBdKJ6gBt8JsTHwRlMVJuccJdM3/Oi3MjjxKSQh0
	 pSTvJhHxGeB2R/X95PaHaFqqz+PEE78g4KGVNKgppfNc1JlGORNymeP9xXCXHZoK2I
	 /C+m/CNuatDfza610Syo7urvrhwoseRamQW6RUDE=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:38 +0000
Subject: [PATCH 02/16] media: v4l2-device: Add struct v4l2_device.flags
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
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1551;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=ASCHccvtgsXkln1Yc03LRzPTWgj56l6pbfoHKx4UZOg=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAOw8FK5g9ikKA75MS74AXpLkpKZkL1+Blp8
 2ZyoWiVkTOJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQDgAKCRDISVd6bEV1
 MrugD/9dgKiam8MxBAQ48D6wxNyynXau50NHQ98yL+nEuKLLdX30g6gMOerkZPDTW+cT39PHM2z
 bTjDo0WCq92kkiBjhOrHqnfFxXbEJJFL0+j9Ha6APKkRHC9Jc0h19HmPQ42G5LY5qI/fJK02MVS
 av5qBRAddkoLQKTXl7cy8rZzDdc7cHqV0nn2/KY3FIo+Wz8dD3XfUvB8wgumntqFqixmuELcpOv
 0pNBgiI5HbgioU/77hvdiAyahW/YyhHwNumcC8Xtg+VarFqcrdLsiTj+5V7BAy6PL6r2qO2UaJ+
 etgWVqKGWhn4VAsdeLxtynhFDFffwbl/6comEQPDkn2yrimg05Xj4Tq6Es6324xT2vcsUehNzjk
 VQS8gKNdsmBoDcWj4g6Z6c6PIox8dOouzk+KWFkE/NjG0WeBRpGpX6AuH0mhrA/ZTzo0iS41/BY
 Y7W3Lr2+d6xD0J8rUMvgK9JaGxOj00xaBc2Gjx5hahgiTgqxkZ4Ou5AkELDMUfq7uRL/XUskDI/
 A2TGLo0y7SB8nEge1LU6D5ioT4FhXw43KG5F99xSZs++rnxcZkLHMbDVVDlod52sw8YY0WNiseD
 J3S2GQh1T+4cgdnHsQc9voZutz9guCggg+lBr1sEE7Jei94LMHTj83YaNtr2WQtECZI1iJwFF/b
 kPL6MgQZUaxuNyw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add a flags field to struct v4l2_device, along with a single flag
value that is designed to tell v4l2-async in which direction data
flows for this v4l2 device so that it knows how to set up device
links between subdevices connected using the async APIs.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 include/media/v4l2-device.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index 25f69b1b8db03d077f7570471d5c6910fcafe110..9b17916d63641ba637cf8c37aa925749bd4e2134 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -15,6 +15,9 @@
 
 struct v4l2_ctrl_handler;
 
+/* Set this flag if this V4L2 device is an "output" rather than an "input". */
+#define V4L2_DEVICE_FL_IS_OUTPUT			BIT(0)
+
 /**
  * struct v4l2_device - main struct to for V4L2 device drivers
  *
@@ -30,6 +33,9 @@ struct v4l2_ctrl_handler;
  * @ref: Keep track of the references to this struct.
  * @release: Release function that is called when the ref count
  *	goes to 0.
+ * @flags: device flags. Can be:
+ *   %V4L2_DEVICE_FL_IS_OUTPUT - Set this flag if this V4L2 device is an
+ *   "output" rather than an "input"
  *
  * Each instance of a V4L2 device should create the v4l2_device struct,
  * either stand-alone or embedded in a larger struct.
@@ -54,6 +60,7 @@ struct v4l2_device {
 	struct v4l2_prio_state prio;
 	struct kref ref;
 	void (*release)(struct v4l2_device *v4l2_dev);
+	u32 flags;
 };
 
 /**

-- 
2.43.0

