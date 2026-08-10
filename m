Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618C53812D2
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 06:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343145; cv=none; b=iwDyFvjBCgyxSykq57rlHl2Ky1AI0OBkTQ2tK+iQOLiVqZXD23NAdmkqO9qIXz3vsUc/111GHrSj3ljPo8JDfaWunKFhFKS/aXdsoIt4GZptPHq4HfdyTX93Cs+EQRJ2qQBoqrdnVDmKg9wwQg7VFx1Bnxqmhj588KoxdUXxN6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343145; c=relaxed/simple;
	bh=VxI4YwnIEvRBHYTD62MGgVzbo0v1YE11LFlnHHYsuyA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V2FNeK8LvHAiUQSZHG3U5DtjBWucEf6FXx/vpQrrQpkJopRPdd3U+I27vKU937OBNxZLxzu0KUYnDjUIeYEBtPVGioKsWYaIPB0aQ3pzLVtGIf2t4Pm0kf6glOsmzqzeg1JdhoExJknH8HsWAwfcrowkPTkBQ7WsP8mo8+3mZU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCkdkxz/; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCkdkxz/"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9aea40d799so723466a12.0
        for <linux-media@vger.kernel.org>; Sun, 09 Aug 2026 23:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343142; x=1786947942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6svQF5GPAZfouFfjRsxMRw5S+3HKyD/RZ/OlzpdStc=;
        b=ZCkdkxz/lM4xfFn+JhoYl461EWV7hkqcFdEwbT5IJA8Y5H/Kue5XXn0gyMY0jb+UUF
         +XihhGHP8pe2kPPK5ghLGWMai/Kz0wIFTU0sKfWCOppzr2GiiyCBFy8Of2XRzyH7zi7/
         e7dnd29f7kSfnaNesmdqyAYOpE3rJ+RSQfNzf33Q4ggpMX9GRMjErZWb6xrXDjTmkqiX
         0IPJ4zMSQ+o/DAUrjKz3nz3UC2wDx7UEtNDG5CUkK4VEUedyGmXQVfTsBNrImccgTj4m
         4L7KWh6yz2NYsJxj/xBQSBbYqlf1aVOSA+ZpMVAOzZu3/PyYTagyI4G7RDBLL5en5fJs
         jO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343142; x=1786947942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6svQF5GPAZfouFfjRsxMRw5S+3HKyD/RZ/OlzpdStc=;
        b=mkVgew14mmoTXG/SuvAXIyVn9NNTm/5cawg/Wc7wEtxFZjhbHyM/Yg+PD+mNYbSoQg
         67aS/eJ8y/YBxmE3LrQKFKGIPtNRihWtzHOVGh4qP4LO9V7vuVM1IC+C8DV2c6g1s+nd
         PPrCl+Xim3fDwiieDD5g7ykUrPzMXDY2SwXZRH6DIzAmv47fHBIZqJ3ZiLSaMKL56yPQ
         gmTpZtp/esEKvJgLCbcJn7pUeZ2e4cTakwVr4NKpo/mkvipOv4Z7Dj0nxQSf29LJxIPg
         eaQanKvezrNTvIoMaHgv3MIa8wKwdHrzsjQuknO9X8bL4vIjc8if0qi4zfo0K8jTIucq
         3MNw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8t5NnGlaMtW1BQCt7lcb1mPKT+GdANOJScSEDgf3IRtc2Sq9BwAByBNG8Wdf2hh3BIHgjtpOljTY8oA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWrUNxsH+3tX7ipKm8Wp06bMLJLq62Dem4PN0uMsvy8PGY78M2
	Rkho0M6S2jW7Nhwj8/vjrE5BXAM9Z6ZZbC/QvUXI9/r31i26EUXTRG/B
X-Gm-Gg: AR+sD10InNoT9iJb+RvjDljNVMJHy/14LjzS+U3N9Zh//Vsk8HyuLaHdQtKH0shO9fe
	pZ/P+fQ4PVjk34Cbs09ESmoKM13VTS1RY9tBTgsirBgrLnQ3CgW3EoI6dhHKJBffwuIL74gTn07
	c+NtvRGjcTofRyyVEwnUNhhIWm9J0jn7OgV1jn6rPyClgzS1Fn6gZMyuAtXKdRdaeq5DjX9nTr4
	KwXZLuzaMQaaqSTYkRwG11NTPfzDJWff9eBRebu+St1HK4n++4qGJqRaKB64pEK1Sg2W9MDofy8
	w4v7c7QWNu1YeUgCeocewZykDh51qX0DOLtDKQbO1HBMHT0yDna5xbZoLKcW41Nv5jfo3z1Slsv
	m9H233cMUAgYm++tvkmVouU8V19nkXnnCTh7dYoTSVN3WRTjlFaDGmrLsLg/bgqbBWESqCCorfw
	QgC5J4Jk+44H29lk1lTX8mTB0Ar6MJyvrpgo8fL05GtShYG8rePL3Iq4SUqrtkucvitSJXtezt5
	ppwow==
X-Received: by 2002:a05:6a20:d43:b0:3c3:b5db:cd93 with SMTP id adf61e73a8af0-3cbce7999e3mr19834403637.13.1786343142488;
        Sun, 09 Aug 2026 23:25:42 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm40642912eec.16.2026.08.09.23.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:25:42 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] media: sun4i-csi: add notifier unbind callback to drop the source subdev
Date: Mon, 10 Aug 2026 13:25:21 +0700
Message-Id: <20260810062521.1709379-4-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810062521.1709379-1-congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <20260810062521.1709379-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4i_csi_notify_ops only implements .bound and .complete. The .bound
callback caches the remote sensor's subdevice in csi->src_subdev. When
that subdevice goes away (e.g. its module is unloaded), the V4L2 async
core frees it, but without an .unbind callback the driver keeps the
stale pointer.

A subsequent VIDIOC_STREAMON reaches sun4i_csi_start_streaming(), which
calls v4l2_subdev_call(csi->src_subdev, video, s_stream, 1) on the freed
subdev, resulting in a use-after-free.

Add an .unbind callback that clears csi->src_subdev. The pointer is only
dereferenced by v4l2_subdev_call() (NULL-guarded, returns -ENODEV, so
streaming fails cleanly) and by sun4i_csi_notify_complete() (which only
runs while a subdev is bound), so clearing it is sufficient to prevent
the use-after-free.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 .../media/platform/sunxi/sun4i-csi/sun4i_csi.c  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index a8711336a754..f19508f2c7ed 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -122,8 +122,25 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 	return ret;
 }
 
+static void sun4i_csi_notify_unbind(struct v4l2_async_notifier *notifier,
+				    struct v4l2_subdev *subdev,
+				    struct v4l2_async_connection *asd)
+{
+	struct sun4i_csi *csi = container_of(notifier, struct sun4i_csi,
+					     notifier);
+
+	/*
+	 * The remote subdev is being freed. Drop our cached pointer so that a
+	 * subsequent sun4i_csi_start_streaming() does not issue a
+	 * v4l2_subdev_call() on the now dangling source subdev. The call is
+	 * NULL-guarded and returns -ENODEV, so streaming fails cleanly.
+	 */
+	csi->src_subdev = NULL;
+}
+
 static const struct v4l2_async_notifier_operations sun4i_csi_notify_ops = {
 	.bound		= sun4i_csi_notify_bound,
+	.unbind		= sun4i_csi_notify_unbind,
 	.complete	= sun4i_csi_notify_complete,
 };
 
-- 
2.25.1

