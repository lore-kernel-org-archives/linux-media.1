Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFCC2E7384
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 00:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308758; cv=none; b=iiMngCiWbZ2KA0Vp28dP2mjtp6hJCOe7X6VxUi/n0teSkms8oEVjqtAIOplRthik0pX8r0kiNbTrXhp3JK3qSq6b+xRybi2sII9ljo5anIrpnot+FKGM/ty3nX2rFhjAlbyrVm19/tE+4EtqC+++Ijrp9MA/VyOZFoCJs95jkV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308758; c=relaxed/simple;
	bh=OrguBF0469JG2pK3364edLr8OvZI7wEyhEIZ6DU16ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OiULu57rDht2K+rqeQ8DhsE5rvclcrZsh5qHcajB6qNQn/Mlu3KoxE1EMuGJKEZX/Z8XDeWEz1rCBWOV+7kFoES7oj0ODCmuxulQWJqbkfud5a4rGnqnqVk1XDBBr2lfVViZJ8YllASUHXh5vs77yatHe7fLd/CSdS0tXa8ck2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4+w/NoC; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4+w/NoC"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66d116f0de8so545192d50.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 17:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788308756; x=1788913556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rR4HvvkSZSXWGaiSoIrlDM6ioSrlrhDFTfgpP1XiDW4=;
        b=D4+w/NoC9YDabStQYjJs4p8C9yrAj0GTSwxhsVm4E8NmujepH7Av5xGah+AsWpYuZt
         9w5zJGB9QBEzjSjnUq4Hr63Yfiw3WxoKlKvfPnJjYVHc68Q2c5cZZ3ALt6uHXDGdTpgP
         Go1wTqvIqCn7FBVSY0Pn+lBdwuKtPn33Q2OT0VkHCRnilGibqLfQ5PWUKjYhKCHN1GE2
         oS33yadYkxNv/WoYqbMDjumUY5O9lczVH0L7n2Jhe8UACz/j5QLGlOdYEMtuAelh9k5o
         fCm0JBpCatLneXYW3Hmf0bs933OeIaYdpr0iW8Daedt8DLt+vVdIQBlTx1EPFx623pBj
         WZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788308756; x=1788913556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rR4HvvkSZSXWGaiSoIrlDM6ioSrlrhDFTfgpP1XiDW4=;
        b=R6xftKTE1t8DT09+rS0c0Sde2+wclYHpYltmda8gIJQDJM1qktEhgxlkFcnuioUJXw
         taU/AVSGZjxxJUrEV6hQf81Co/LJOSTk2GpQsygxX+B846WHOgJOswgagwuKMQUfy0Ul
         UND3aQsVd2Gql6LvW6gB+LbDzRPIEwBH53d1SsgDtxQtHFPMGeyODFr/UNYXR9KsQjox
         8wN8QldVdqz/Dr0zms50okfEqiEMWHLA2/R8WUdrDmXaodI65WiPVRIugxezv0hsxyeg
         Alyhyv4/RvkGRxCLF5ITnpumTadFkrQI3QxhtbXC/HgJKWih64hBkMJJdRUCUxmo5krL
         3oeA==
X-Forwarded-Encrypted: i=1; AKwUvBxka11aiGZT4Bqa9HksoNFDu0/rCyHk7v6ZYizd5GdZUAO+pAm+NiXW5gYUCNZ0eB1VI/gHNk7K5O3Khg==@vger.kernel.org
X-Gm-Message-State: AFuF++kYnhxRkBsItwhA015XyilbXG+z+1NnI7KY6bzwUaiIgq956ON1
	8JCq6UCPF5AXk7l5WqXlWxvKP4SpDSDUaokUODnImv1NL0PgF7kEWnG0
X-Gm-Gg: AYBFou1CjJVkoMKDNv//HkkC2O93Yum7WtWzi8Y7KH3irUASFhZqbXPrfJH22e3YMke
	z2zRlEqf/KiAVmB59ZyCv2Fr5fE6FP/ISS6iMeT+mbRYigUQJCN8t9L9SbyiPaobeBJxygciQNQ
	2j4f5rKxA42s4asj3ILy5qeQF4AP/65psix8TY1GfuRKbkCKlwav6ZJ9kA5yefqo0hGHgt7L2wD
	R93wYTaM7WeuETLiLWWE0pK8T9bKJ4j+4gBaldYSoZeiYcJIPjol2xlEM58TsVxwd3sWA4H/R3P
	D4XTjgqVgS5PzHrYwp6NwcpUECJxdfpB//HL0xM//WCOP/I2QUoQ3kbKzQAIzSxsF90mfheYw2+
	UrRQdv2h/Yx6xza96fjdQr0JPhsx9MNUYlYcR0LNTfthylqqHZvCcQ7l/PvC14rxoV7DqQxbhQ4
	38QyZT3DE3jy4kMc1DPhHdarUv+HlEE6dKwuYiTrAQEc+2f8LwvFjk+T8vTI36JOvxXuJqqRBll
	VxLDQYMkYr7AqEB4g0ojXdVaShwpGOKeJYBQxHdKvg=
X-Received: by 2002:a05:690e:12c6:b0:66f:7dbe:74f1 with SMTP id 956f58d0204a3-66f9b93156emr407634d50.2.1788308755886;
        Tue, 01 Sep 2026 17:25:55 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f98656c1esm755344d50.11.2026.09.01.17.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 17:25:55 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v2 1/3] media: uvcvideo: report AUTO_UPDATE controls as volatile
Date: Tue,  1 Sep 2026 20:25:51 -0400
Message-ID: <20260902002553.34839-2-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902002553.34839-1-jordan.mymail@gmail.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A control with UVC_CTRL_FLAG_AUTO_UPDATE is one whose value the device
changes on its own: the driver never trusts its cached value for it,
re-reading the device on every VIDIOC_G_EXT_CTRLS (the rollback at the
end of the ioctl runs uvc_ctrl_commit_entity(), which clears ctrl->loaded
for these controls) and re-reading it after each write. That is exactly
what V4L2_CTRL_FLAG_VOLATILE describes to userspace, but the driver never
reported it, so applications had no way to know that the value they read
can change under them and that a fresh read is worth issuing.

Report V4L2_CTRL_FLAG_VOLATILE for AUTO_UPDATE controls. The uAPI
documents writes to a volatile control as ignored unless
V4L2_CTRL_FLAG_EXECUTE_ON_WRITE is also set, and this driver sends every
write of a writable control to the device, so report EXECUTE_ON_WRITE
alongside it whenever the control is settable.

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3ca108b83..aceb26310 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1840,6 +1840,17 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
 	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+	if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE) {
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+		/*
+		 * Writes to a volatile control are documented to be ignored
+		 * unless EXECUTE_ON_WRITE is also reported. The driver sends
+		 * every write of a writable control to the device, so report
+		 * the flag accordingly.
+		 */
+		if (ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)
+			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+	}
 
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
-- 
2.43.0

