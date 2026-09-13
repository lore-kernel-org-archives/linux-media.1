Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892A2349CC1
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 19:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789328341; cv=none; b=dlKRrVxwdwwuceg3Lu58pis4kPVfRRXomTUfdssY+nsQ3DlTyxlqliRQAunTk52TP38qujGvNiG1MigrChV3zTFhmI6jrLxXiPMOlAaK48340rC39sRgV3DTSlJM2nCVzkZSXBatHcNxIICyxwTfXaueRil4hqP7W3oH1xr5nOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789328341; c=relaxed/simple;
	bh=re3NJ+Jsd05aIRZR/hmrtpLB8vZj1nW+xprxkuiwqfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sYvxzgblQIY0QBEhG65NDihJxk9kOizJl8kIIkp05T/LLZdHszeeQhivmHAoP8XX5sHZukY3vWiHDlLsiKeBKHwomWySLimPt1vO+Ed0BS+RWipiekbch9oewneaY3KVHxPJqVWuQv2ZLdzmEuIjOChrOGpq7R9UN0KIVOP5yN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTCeQqvl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTCeQqvl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso12841195e9.3
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 12:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789328338; x=1789933138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wqld+C8LvUG/lCaEhAE1S24AuEqbvNc9EFv8rG0tUzU=;
        b=WTCeQqvlJyppviaQq+U4Al/A8fkLWy3Oio/lKhnRzjCMC+OYvEL+yEYBcM7cGVj92W
         1IOhbtvx7NQGBh/GeDEWypQkuzI2oj7pBvePtRY+PKCag6WJlxVU0jlxpEIEvlqEfF1M
         bDIPbA3BWZqldFFdZAUo0O/fZGu6DrSAt8Qdxt5sb3nstvVMIG03g2JWNd1mCWDUz/eo
         AL4b8IwMMF2iRFd4bRiS6eEXJhdCcawqQ4qFZMZYKOoAR+DSzUWjSQaNrmnFiTIzaNC8
         akvAyQFOvP1SSCDiai+0PzuQM43IQrrUCdiKzMSycnop4BOQinkQgaRhJ+YzR+8JeFP2
         wWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789328338; x=1789933138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wqld+C8LvUG/lCaEhAE1S24AuEqbvNc9EFv8rG0tUzU=;
        b=ID1J0fhnJDS194dmstgTMDJSPANG9yoVq+hW+paJZnIBjhL4cdlodTg7aOdm6XL6Mo
         uGcuxII7cm/79ifMpttaL1giw8+WDTsH1xjQKYdI5sb5gXjOQJDjj+sK1E0zczicqUDi
         n+bh5GB4ZkTPVAfLaCs75qwFWp/Vl5gMoLKVH64eZT2wc3pB57oN0f+z8smae59II9wM
         vZx9r2BU4hvTuYSTXAmlW1dvLTaSiU4rxVv15f11+FB6p5ItvWWf5QlGVjrg3TI9SA50
         uNNSYG+FSFIzneh+tlDgjiUtqYqebOc3sResuLq/otkRL+fz6SYO2+kIpoKWj+n2uEiJ
         C+Sg==
X-Gm-Message-State: AFuF++levOmo+ujXf+vbK/EXPFdK1l8u4N8XtOPgIznazANKN3SiAqm9
	3u9T2ivn1RMhfDJqBS3gkI7SlRG1XZ+pqr6hXlf6x2JL7Xe2Iij2N2u1TahuU7J7
X-Gm-Gg: AYBFou3JFBjYUDxjHDoRuG2zyrBtSh3erJv7klhpfV+ygaPRu6CUyvNl8O9bTwzf0tK
	8t+gke7ab9kcszpHT6kRwKZ8lcLTi3mRqyhsXTDH2MutLfhLkgP7b3xetFCWgWN+6M1Xnmqv1Hp
	sGLVhae/rEjPLAQNuWx0U/FccdevAlUfceKdBMPWThauaOw9CbTbxP7SxdYVo1KoQK/zOUWlzJ8
	D4EjzScxdhAQIM0xPfGT0/5ZIErmkisUdWk245M7mWk9Zd1vPPL1FLLqiVpvmYve6R3rv4Mh+r4
	jdI8FyyZdEhnqNdmu0l/FWqdz0HUkj6htU9kyzR0MJL9zaChdHPjzxk9kFdjGCxx+6OAN3oLwCq
	QIYtamjc/lwCnjO0pZKGTIcMN0HbPaRg2FdGf7JJzTNOb2ZacA6SZX6LwcTaNA9hMADRlryXaVU
	HsHZ7FYvTMVhiQ6VM+ze9rGixR6yg8iASQM7Xt9AHnPYs+svlJyDRT8J8sFS98938v7Vz26+NFn
	+DQ344VeoZrvCjSFUp3Dusmi6DthpKa
X-Received: by 2002:a05:600c:3b8e:b0:49e:719e:e215 with SMTP id 5b1f17b1804b1-49e719eeafcmr85068285e9.26.1789328337445;
        Sun, 13 Sep 2026 12:38:57 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.65.89.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm334233445e9.4.2026.09.13.12.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:38:57 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH] media: ipu-bridge: Keep the clock-noncontinuous property name out of rodata
Date: Sun, 13 Sep 2026 20:38:40 +0100
Message-ID: <20260913193840.75686-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The software nodes ipu-bridge registers on a successful init are never
unregistered. There is no module_exit and no remove hook, and every
software_node_unregister_node_group() call sits on an error unwind label
inside ipu_bridge_init(), so on success the nodes stay registered and
readable after the module is unloaded, which a later rebind relies on.

Nothing reachable from a registered node may therefore point into the
module image. PROPERTY_ENTRY_BOOL() stores a pointer to its name, so the
"clock-noncontinuous" string literal leaves the surviving node carrying a
dangling property name once ipu-bridge is gone.

Add the name to struct ipu_property_names, which is copied by value into
each struct ipu_sensor, and use that copy, as every other endpoint
property name already does.

Fixes: 8e3def7bf410 ("media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6")
Reported-by: D. Manresa <dmanresa@gmail.com>
Closes: https://lore.kernel.org/linux-media/20260905211307.542810-1-dmanresa@gmail.com/
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
The series is already in next, so this is a follow-up rather than a respin.

Two things below would both need 8e3def7bf410 itself to be amended. I do not
know whether you rebase that branch, so please treat them as questions, and 
just apply this patch as it stands if the answer is no.

1. This could be squashed into 8e3def7bf410 instead of landing on top of it.
   The bug has never been in a released kernel, so there is nothing for stable
   to pick up, and the Fixes: SHA above is from next and would not survive a
   rebase in any case. One correct commit seems better, but a separate
   commit is entirely fine by me.

   If you do squash it, please carry the Reported-by and Closes: across.

2. D. Manresa sent a tested tag for patches 4-7 on 2026-09-06, five days
   before the series was applied and it didn't reach the commits. It is in
   the thread here:

     https://lore.kernel.org/linux-media/20260906073932.24090-1-dmanresa@gmail.com/

   His is the only report that exercises the sensor's 2x2 binned readout
   through the IPU6 hardware ISP; the other four are all raw ISYS capture.

Neither is a reason to hold up the fix itself.

For anyone testing by swapping modules under CONFIG_MODVERSIONS: this grows
struct ipu_property_names, and therefore struct ipu_sensor, so the CRCs of
ipu_bridge_init() and ipu_bridge_parse_ssdb() move again. intel-ipu6 needs
rebuilding alongside ipu-bridge.
 drivers/media/pci/intel/ipu-bridge.c | 3 ++-
 include/media/ipu-bridge.h           | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 952868a..233c513 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -237,6 +237,7 @@ static const struct ipu_property_names prop_names = {
 	.data_lanes = "data-lanes",
 	.remote_endpoint = "remote-endpoint",
 	.link_frequencies = "link-frequencies",
+	.clock_noncontinuous = "clock-noncontinuous",
 };
 
 static const char * const ipu_vcm_types[] = {
@@ -591,7 +592,7 @@ static void ipu_bridge_create_fwnode_properties(
 
 	if (cfg->flags & IPU_BR_FL_CSI2_CLK_NONCONTINUOUS)
 		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_CLOCK_NONCONTINUOUS)] =
-			PROPERTY_ENTRY_BOOL("clock-noncontinuous");
+			PROPERTY_ENTRY_BOOL(names->clock_noncontinuous);
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 760f076..3ef94c2 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -135,6 +135,7 @@ struct ipu_property_names {
 	char data_lanes[11];
 	char remote_endpoint[16];
 	char link_frequencies[17];
+	char clock_noncontinuous[20];
 };
 
 struct ipu_node_names {
