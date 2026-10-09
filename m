Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF25472558
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530879; cv=none; b=PWUtlK7IZCF4UjDKoorFrC9fEqJ8J47269MHbKqE/4zs/V7hVFeYUSUr9JVDiM7P3eoqJ9USUl8waF8fzBKY7pVtFeCStCsL3TAiFHIuPEXqUCDSpIRFvQBIYUCSPOEnyeX5/raeEE4VHtmsZUBPjXkYAXj6LCXP0Jdr3TAw1Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530879; c=relaxed/simple;
	bh=FS07QFDH4KNo4lb2AXuuz4jAq53zOaZkM9YCJj8bjQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJV4Ozd6eTQQExzgtgdph8bdOWK1urvlvjc74CWJ7OtraSTAoGfHhT4JdLot7wBCiGtYq8/8fzEOiJEB7gjMnE+G+LPbbprU1UVt1OJB+edsBlBJkqyjFCWiQvO+E361MVoXbETlvCBmZPM0YdA5ITHZUVTKhbpha1LtQJhVpQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raPByW6/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raPByW6/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso999633f8f.0
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 00:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791530876; x=1792135676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTei2Qnhpl+2Hry9LtSinAmPey2bHyRGPo1zzLYuB7U=;
        b=raPByW6//DI/W/QxEdkUN64rsp/p9TmfYv/3P6Y5PP+Myn5aXrp3sfOV/JJQbH4qdO
         7XBjD5m4Dfm0w/RhO+0WE2sIr0cPOviGA/Uu9TlZUt36taXtmJ5UEYmMeJBO7/BI1o+z
         YGR3U6vhbKRErgkkz8LKWODqeTVKrhoCKkr/SgZKbQvWUj/BgcNAquKrYoFsJsgdjA+e
         9DToGs/R5GTweQNjrDgHiVIVnK1aWdRMq56xOPmJ9rlhSvCML1HBJ4rjQGQMULjC4M+J
         Z4v5PI48oXE+I6Ab42uMZSgGzYI4pXevUzDBUnWilaDKLTJ8eG6bVh1KjaEkBkmsTT8K
         b/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530876; x=1792135676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xTei2Qnhpl+2Hry9LtSinAmPey2bHyRGPo1zzLYuB7U=;
        b=muuS2yxfj95KTzqdnk3CV0kzJ4ACDMq1ecOcNkwzc3JGgJH6jbC+lPvjYEYKkC7EVQ
         xSJ8b9tPv+wqFPu92BztBLu+F4v6GnkGNxOSu06SSVdYArIr1Uea9HNUssH/NcErKoBa
         aMU9u0IWXDHRVbzRicTtxEamY+hmEF2mr6g5Rvk1hRoW4q9OJB6OidKUF0ZLWRs8r9Re
         HczUl6vg0NDB8b0dFSEcDWRFjervU5frHQDJfwIZUW7BHwhaFAlDykhVpri2aFDC7oYd
         elQijqBskB7Fa/X/kvcCYs6jUieQnH2x41e9rduhzZ8cGPMYV7GjU3q4HJYpvKYjvRqX
         daTg==
X-Gm-Message-State: AFuF++kiHLYizSM6YT5ILhCi50XPV0sXqAiLnFl43DkUIHbkqISSd27G
	eCXC+mjeVpH1hbpe2CqRaOgrHrH9+uhaZohCoWPQ1q63Xjm5QVrxjYQm+iAAGB+gg9I=
X-Gm-Gg: AYBFou0oyFqJys71yxBW2ilE8SFjDbY6dSTSEDgMwag48SYfRJOJi9HC+308aCbEGCS
	5sz2uheqCPeDcq33X7mGu8JtKEMmTq9t/xbAkmEBVkHBOtkILs1sjtPJlV/EQJgqDigcpW1cvBg
	BGKxRpds/L31ZHi8WF7Dsk7P1i/Cgb8kibgUtmBPPyXstnx+EU3vWFRY7EyGG/KPbZvs+08SML2
	w1i2LYVh5T7E8QfVqMw+Zij0rjWQpetRNCSXceSlT1MGzpoqfJk4vJQ9+uW8XOXP5otGKQ+kc7q
	XJJR99+fwyV0STSc00gKYVYQvA1bLnCK+xYyV4Le12RcuV/boyuULqy/U/tsRIvY/N7ifnyiOiR
	1pO+O6rM7M0g04mw/AhIUfvrV76/NaaFQr1lChQG8XZ0lIl0VGjEkLB5flc1vQl1BAgV7Ly1UCs
	twPKfVXMV+AtLZ4zFQKnAZgs3+YWI4etaYOdt/F2uZJfxBr2BYInp3lF2gYIK0X2tK4YVxwbo9f
	A2nekXaMWQPwtzmhDrpjzlo7l2f29nkOgPs7bEfRO87e+KAGilec8KqwqG3UgMtAFuziIy2RSW8
	gdue1COyB3DPyEvVTSuDlzniiDaUTxgbWJQz2M6MfxUroMzCJ2fH7KiT7H8G53IAYqU95pKVwCQ
	HOUKWzwAym/5r9kzF/LkTy1LH8Sf6veeln5nQHNNeQPdJX6i2JxqP8g==
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a18e4913c3mr16111975e9.8.1791530876298;
        Fri, 09 Oct 2026 00:27:56 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bbbdd75sm32598895e9.1.2026.10.09.00.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:27:55 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH 3/3] media: ipu-bridge: Add GalaxyCore GC5035 and GC8034
Date: Fri,  9 Oct 2026 09:27:33 +0200
Message-ID: <20261009072733.39877-4-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009072733.39877-1-nicfio@gmail.com>
References: <20261009072733.39877-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the GC5035 and GC8034 ACPI HIDs, with the link frequencies the two
sensors use with a 19.2 MHz external clock. Both are found on the CHUWI
Hi10 X1.

Assisted-by: claude-opus-5-5
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a..851096d7d 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -59,6 +59,10 @@ static const u16 ipu6_ov5693_ncont_clk[] = {
 };
 
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
+	/* GalaxyCore GC5035 */
+	IPU_SENSOR_CONFIG("GCTI5035", 1, 422400000),
+	/* GalaxyCore GC8034 */
+	IPU_SENSOR_CONFIG("GCTI8034", 1, 268800000),
 	/* Himax HM1092 */
 	IPU_SENSOR_CONFIG("HIMX1092", 2, 180000000, 180480000),
 	/* Himax HM11B1 */
-- 
2.47.3

