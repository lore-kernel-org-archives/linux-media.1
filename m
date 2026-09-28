Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546E649158B
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 21:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632226; cv=none; b=GC6Rz5aLc/qUkmKfWBk2hgexrXHyEuutBKDDoJmcsn6RgZsp33kLh3bEYU6bXLNg6wYd6UwJSmoojhWdwEG4jO53gtkdqKI9kvZ+5V5XwlVCPfkP+FSpvzJ7mHylaiJg1U1QMJnKK6QQ6qIq3rJkuSk4W2DYIbgNJ13cVoWU3n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632226; c=relaxed/simple;
	bh=XoW7LB2/PWn8I3h1KrEZjrzK/rPV8dwx9VMc7EUn8bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cknoyFqVeTvz0vZ4u301nD7wB0i6zZtLnW7s/sKXSHypnsgDamgPv5e3xJYuv38NhwLODHlKzpd09Tp0R2siLiSqvIAh+5TDxSrVQCETUp7SAU5+Kzc48vt+5lPQjDRqFiWBFCOnwdkG0iSKm9ylvwLP1aWVd/iVLdT29bgblWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3AB3k9l; arc=none smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3AB3k9l"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8a9d3f5c1d7so19536807b3.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790632224; x=1791237024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psIXgfN/YF2RfKR13CbY3bbgVwSvbogynomJi/9w4Ew=;
        b=h3AB3k9l86LS2sPes8tuU5uZjP+AViD+NdBlo354aDA/nMsUSD7fdrKt5TgSp8nNZ/
         UbkQJ9HaSEeBTQ++2Eh2hOW9aj0NWyljUZXs9mCJ3olspCUPjWXkrzqZf0UsazM+KCXy
         sS1HyUfhgcfaRji/6sEc1Y4T+3L5QQDf/X/KMYbLFs6u763k8qJWqYKmrBZgPWNalgPe
         ytmq3tz2fMGOtZMJGwem32oKZ9bgAe2E2tvlwQI8Fo1umS1Zdfr2ofjF+p4fqK0gnftT
         Vux6bxiQs1NCArqfJ90qQWHQVBbW+ceRLNemsYhjsUnS0DsA+ARC46M7K69Uc9dMx0l/
         CCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632224; x=1791237024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psIXgfN/YF2RfKR13CbY3bbgVwSvbogynomJi/9w4Ew=;
        b=X9VTNfZP7JVc3o5tB155aDlltGkBMKDuETaH7eh4ndes7rXO3FzYyTS6+q8Nz1UwUZ
         9F/tx4VnbFJ6PH/a0c3kktHzr/mPT/eLe0slXlvUZNsUdLOq2bEBZWirEyrWhqP3MJ//
         YmebnBMwpPowxqOK25sGdtN1cNZ+NEjw9M4u2Mh8eXIFhccIzCjS90zyvsGYgJObrqkn
         9YlY6fYSszQa8ZClkdkbKjHWtPttwZyPhjtOvPU/wwJ9ayxQjINu5mJaIxhrVGlY1n4Z
         1QoLNTgJZtMBnsviu++qE115udCqyzwKaEn8/L4ry/GuoIY1k/dUYymMEhX9+rQYVoOI
         QUBA==
X-Forwarded-Encrypted: i=1; AKwUvBxHsuaQxw0SJO8RtmuNpy1rEysIsMue8BztjuFSg7Pw+4TvUI5GI+NXDtfkbxyHEWDYB9oK8mzfhRRs5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYILJw0CX5lDjG9hHPIgxzzNoCjoVoiqpMOV+/b/Nmnn/HGgKKy7
	JA88ExtjmMDPsUJrCa7OoedP/WE3IWLktrPTaqxEUxMqt9ES+q2aUAyU
X-Gm-Gg: AYBFou06JghZFEN+VWpBOSwVF/TUM/2KPqdidzKHVKQFREIAUGOpgYyyRskqFA26lwr
	B6GxyQlFfsG4KvQvaovXzJhWxQSlVXtQhVdWK/WZM51e/cwTTdDdx//AAstUrKlTQYTZmXJVDZp
	UWXGn3sxpLRqPgorSw/EfoVXCnr50hqkTvpY7ACQgle9gsqj3XiczFjY7bgUii6w7mKfmaOY0iR
	7vHX4aCsQvRDplS1zf1hQnUP2gjfqPTBn0RUMvTiShk/f6Lf+iQrPI1/Qbx93Fjrv4dqYzJA2PV
	oyh3CeJZ9NGr7C6IwyWDkxCQ4iEVzJWNi/bw62JomWznK1cHV/I8xlOj3hkjprEMKLWiOPx0NjA
	vzrX+yZVb10DF1m0bzcA0hxnZbacxt+BIEgYc8fqrD9AepQgVchVoQueNOlZRW1zQ3K9QuSVZj1
	JQWHxTU2cs+mg2YtOVQfOHnU8W8xTN4oaEKqmMQ1S2rJK+kOlbU0RiOaQbWHYmELX6xk9R4F35i
	oF9BC2pplG03lixx5KHevZOM+dSzhhIT2YhIfl1oWnhmXO0P+XRQg==
X-Received: by 2002:a05:690c:e1cd:10b0:8a5:2652:9a03 with SMTP id 00721157ae682-8a6466aa351mr41747467b3.42.1790632224311;
        Mon, 28 Sep 2026 14:50:24 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a861012f4dsm50897647b3.37.2026.09.28.14.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:50:23 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [PATCH v4 1/4] media: uvcvideo: report AUTO_UPDATE controls as volatile
Date: Mon, 28 Sep 2026 17:50:18 -0400
Message-ID: <20260928215021.819064-2-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928215021.819064-1-jordan.mymail@gmail.com>
References: <20260928215021.819064-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AUTO_UPDATE controls can change on their own, and the driver already
re-reads them from the device. Tell userspace by setting
V4L2_CTRL_FLAG_VOLATILE, plus EXECUTE_ON_WRITE for writable controls
so that writes are not ignored.

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3ca108b83f1d..aceb263103e9 100644
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

