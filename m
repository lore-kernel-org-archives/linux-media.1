Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B886F4A64C4
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360851; cv=none; b=kGFk/QCRutfDBfw2HcTYnn7gtz4HITGFGs5G6HJ2s/DdBhO6sESLoQgeZD61iVFrJ975PBM+8ekKkSqPwwLnUberQKKYm1O1Tu7ZkmxVy8TYHIhSH+ROw0SdubvLUaDR8qNXJ/cYX4m6R9ZqcDKZMKnwq92odJg02DDeVgB05I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360851; c=relaxed/simple;
	bh=Bc5RyoPyL8jsNo0TXqrSYlmk5vjAHujKpDa9NlkLa3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkjvNCz9EUpXFmJ6dkcgfVVvDgXnmdMeRV3aoGKod0vnPOgLXPxvzIXiDBiXjDoSg5x4V7deTT1yFwPs/siQ8mCdhPmty0Yn7HVs23ndxsBTx8BEZe8rC6zp5TaNR/MWadB37xLwumbyKHnpm1b+uLhMtulggF2qTyUyWK+Djdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mU5k1Z4g; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mU5k1Z4g"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-484392e3d33so716607f8f.2
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360846; x=1788965646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6E5NgofUMoTlxAp6O0bNxVMULKG1XOVZoONL4mrJbw=;
        b=mU5k1Z4gPFf4rcRZW5Y1qZjCOiV/bVBFWVgO/IRoZKZ7X8FNdXMcnfq2xWh6RzcDzv
         2CUk7qu/zQj+fBvz7ikbjXemufTBObRpVvgfM3NcOIIzU+j4kt5scHR384S98Jyme9Zv
         c4yIcrRBN+QndF+Wsjtd4ijrH9HlmwhEz/Bv/TvluS2wg9WeLNmGotR05j2a7YTnFPMC
         51r1lgZOAuNVYLboMPG3rIeqPl1jP2C/GvF9ZIh7hRAnb0miztb6lnTYPVfa3o780J0s
         smh5OtsSjFZgfpjoIaXzPZ9nCqdj7ZHsgXTXtaQ4mKp6kGS40tre+DJxI1SgYtPCZoKT
         /W9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360846; x=1788965646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6E5NgofUMoTlxAp6O0bNxVMULKG1XOVZoONL4mrJbw=;
        b=mZ3b76kj9VNgLGfSTgldGhqK+buWFX+B+4ujIZsEfxc3fAP8RPlpwkiu0Y3KwNV/hl
         Ne24eDdfdhBtD1/RrISs93lUK2CDqq1dcA/T/EUfuQIU3V0K6SlQsr08QNSxpQub2Cru
         Lavxb40M9zQ82Y3jnd3E1PtV6FYxzOIwbnTD7/rnwsHEONIVrh3R84xgX/0YdrmWDbMH
         0PdkBXG6dM0h5fmiJJCGmoOsWSC/E1RpsQfmEPj3aOcbeuyg6sxIEHSMJ3TfFrfzM5m1
         q8F70hxdPcO2ab9m6jKYC5mSEXNfNpwSsSU7wU8KK+BhAoLuYOtVRcKbGxUb92Iz5HFn
         BRLg==
X-Forwarded-Encrypted: i=1; AKwUvByGG8gxVvOJJHEJ3772/hNjQILVrVcyt8MN5KC7Hzvd2w6Gx601aYw/Ix4T/5/MAdP5uyHXPDMMCAJvYQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kSWbO94V7qEo6EtmgPy2y5PBWW5gRIJszNV3bhV7cnJwOg979+
	NpCMQ2mBEjQ5mIzSZXD7EtwxyMb7aIvjAkxy5CkSu63WjcqQyh+2vVhe
X-Gm-Gg: AYBFou1vEv7Y6We4jB4RU0XW9237Omp5Hn5J1QoQBguJ8FjEra581HyzeWgZeKinHC8
	Oshep+iIGOR+01QIkliwluAJUxJqQzn+QK8db6pTBys0bQjgJF3yFuvkRr08kvzYXmhNnp2/rAG
	Q3dTLt5mMdxgY7yYIoyS3sGXLEzY8lWPwZEWhAXm6ATpitJJVomWWzSx/6PKRDQkYCNUbTCmt0C
	Of8C00uYp4XV3vzdQE7kx5rfajpdaNB6YGAybK73YsBXQHfHkWlYY83FbK8V6YC/V8tLaaCMQ9f
	6rnsGwTsmbyRX9kvv3IEcwNvqjxzNafhQlA3rBsSqEhLg8hl7M0u9OvY+SVWjWvFborfqRfDn8u
	XIhbzbZQwiMVLgnGgYSKibLw/Ov35Yjf/XT9UArhPQhAKz0Y5T1l2yJgLANH6McStonuDEWvO0I
	a0mL/xA6YRT7lXffPpDKiyDheyUmpY+q9vztuxPb8ZaxxLrcOpKzW39kVpyVk3KqsJQmFgoJ1lu
	1XcpnNuiqfvf33OjDmjoucgNipnQaYdisvA9ClnN8+NvuEqw6yjVgI=
X-Received: by 2002:a5d:591b:0:b0:47f:8d71:210a with SMTP id ffacd0b85a97d-484913b978amr7666724f8f.15.1788360845742;
        Wed, 02 Sep 2026 07:54:05 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:05 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 09/16] media: intel: ipu-bridge: allow sensor-specific link frequencies
Date: Wed,  2 Sep 2026 16:53:38 +0200
Message-ID: <dd8bcb40575bfcb11e92d976bec7f2b26cb95ca5.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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

