Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FC44A2606
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289502; cv=none; b=LUVcV9uuTLTGwpYHgBFy46+n34lAcQdI3ASJDzlT/TA5i6macQsFEWa+Kx3DC4Tcvz02hZ7em/qME3Suxsf+vjqMcFgl8Bkv+R6+jXzO9hUrLhXMcWcSx871OhJrAEWYK7JKSeXYoMEhKl+TWJwPfFkjSjIVHdCyZ++xIenGS74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289502; c=relaxed/simple;
	bh=Bc5RyoPyL8jsNo0TXqrSYlmk5vjAHujKpDa9NlkLa3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILjWgC7UcW6QCQdk5Mg+TpoKZlYREAS7Cx3//Ru3EVvJNs9nP3055O4wy/xRnCrs0J9xznd6JRV7mOd+FIklLVjzzZi5UWMTvpO+eo2eRxkxpREAEl/hazJRr3OPS6ztH5lasZgE+tcQChSDr54C6Ijt8w0RcF6LLhLEd3oj/5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSeOPCi3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSeOPCi3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so1243005e9.2
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289498; x=1788894298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6E5NgofUMoTlxAp6O0bNxVMULKG1XOVZoONL4mrJbw=;
        b=CSeOPCi3HR96S6riTmDHrdrX7clNBFLPpk4o2HIxvSOKDnmUJgrY6CY4ISjqzHlyil
         8rY5cy48Tfl1bgCeNo+n2/yPNptDmZVJHPk3DDwwm2bDvb8hjeRFrXtwIpGZJ+ZeSC4Q
         dN/6pP8IJKmklDZzVPrt7Z60ZjLMan7Ox0YjiXao0fxB8jcPwVUNgOjS+Yy7MPyKl1fF
         AC2Z8Z0/1R3hx+jxW9k56ia+a+9k2xn7r/zsMkrVosOit3MeHg5xpvMttsZ21NU2jugO
         CvRzm+0Bk6HJDb4FaRfEQv/+wI/cVX9G8g10PpV4KY4yZRTqcTINv24MXpgCKPQ/FwBY
         2TCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289498; x=1788894298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6E5NgofUMoTlxAp6O0bNxVMULKG1XOVZoONL4mrJbw=;
        b=prcPDq9BTrVGsu9/qo/MiFmc2bGEKzQ5aKlKk6/do+RsLvgpHHTV4jOfA89AvpCGX1
         ZelUGb91taoNxxHkPPaqjqjXrPlSClb1RcIDM5MdsUZPsypz66mC0MojXFwoSC9GoeOK
         r0nvnEwRz3KAFsRvfJ75TgdfapXfxB46yFra5YavrqYAAnnepeNn6nRLrrhk+tzzRYcK
         mA2eW8s+Fx7joLMLoI+ZVKABWjll/NPQVEUS9zYE3LKo1gWuvDDoSgnqTqcHeWpgNIBO
         Sk0E0dEX6aQ1/bTa9Clq577YllAWalqAHffMui24ukhBPoji+I3gdiR01okHM8vBTGOO
         5CnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqD6YGB9uirJ91Yjy5jizy0g3a2DNtcSPUeh8J6gdtPIuRGt7Bys2FiVmSSN1c/Mu96Mh2b5uVZWx9GKg==@vger.kernel.org
X-Gm-Message-State: AFuF++mEIDXH4emAoc5KHBywRh7Iqw1Kshee7j/Y777fdA0Y3gG6fsXw
	pBRA9t5WrD5NJODLlwK1GqZjUiWOxg3IHWD/x0dFftwHSNIh1/3TTBZa
X-Gm-Gg: AR+sD11oyIW/aYZsU7n9rJmlM5xqbCQzJFuU7LGHkDEri2rhujEDJxVY7DoBLFn9P1d
	74gLOcRC7ho9iKEnT0OIUNAMYIurOJcu7lgPFF5ykg6zO5WSypLTooOHbzEsBRhAI1u/oIk3d4C
	Dqxm1bFeOciZU9pt+bCD9bJ/H8l6eK4h7MIXxCdP4Tj6WYtEqndLYjwZZ3Gwmv2CpMByF5Yvs4v
	vZiZN5DzkdlETQXsos2pCwyr/+FNwPi4WUiTfTqemObRq9cdQWFzujbV2iMyDfM6jgEwdCsPtGi
	SdPjSp/sI6aAfyD9irucknNz9cfpWXauhPzBnwjs1/122EJa1Utcrg/OnXiyY0VBUJk3C7eT+9W
	yEsFXsMcnDbCuTuLJbqzjhPIFyeNhYGdnUjstpTRtFMaBPY1jm9d4sElUiNwmwMoz5x9mmw0NPG
	iDtDpcvHqZKoUuzEsAdvu7Tj6KJgjnh0WHj65jrXxg65nNdyx/9nmAId9fllth6kqWjSA0ZMc1J
	wQJqXyGdp+VMbiE4m9ZvmLN0o7gqYj+mim4N8IfG0o=
X-Received: by 2002:a05:600c:3155:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49b91c3dcb4mr544509945e9.9.1788289498025;
        Tue, 01 Sep 2026 12:04:58 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:57 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/16] media: intel: ipu-bridge: allow sensor-specific link frequencies
Date: Tue,  1 Sep 2026 21:04:31 +0200
Message-ID: <932eafc6726b4e5d062a0166dc4b5e1594025fd1.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bridge-specific firmware parser may have more accurate link-frequency
information than the generic ACPI hardware-ID table. Let it store link
frequencies in the per-sensor bridge data and prefer those values when
constructing the endpoint software node.

Existing bridges continue to use the hardware-ID table when no
sensor-specific frequencies are supplied.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 15 ++++++++++-----
 include/media/ipu-bridge.h           |  3 +++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 47317c423fad..5730a95767a2 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -520,11 +520,16 @@ static void ipu_bridge_create_fwnode_properties(
 					sensor->prop_names.remote_endpoint,
 					sensor->local_ref);
 
-	if (cfg->nr_link_freqs > 0)
-		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
-			sensor->prop_names.link_frequencies,
-			cfg->link_freqs,
-			cfg->nr_link_freqs);
+	if (sensor->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     sensor->link_freqs,
+						     sensor->nr_link_freqs);
+	else if (cfg->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     cfg->link_freqs,
+						     cfg->nr_link_freqs);
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac765456e..81645a5f8709 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -133,6 +133,9 @@ struct ipu_sensor {
 	struct software_node swnodes[SWNODE_COUNT];
 	struct ipu_node_names node_names;
 
+	u64 link_freqs[MAX_NUM_LINK_FREQS];
+	u8 nr_link_freqs;
+
 	u8 link;
 	u8 lanes;
 	u32 mclkspeed;
-- 
2.53.0

