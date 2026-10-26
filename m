Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986653;
	b=N/kr+zWLLbi5K/FbXKDM08sMGFHRvdWplQZmExVyJ1EJ/bAdr19lLpGpKljZ9q1/Aflo
	 U670XtVbBeFNYkK3FGJorucAIl8mQJAOwHooi6fR7DSxhS6VxZXOFEOeQWDJ7Q5tOQsPM
	 FSpQL4aA6fGpzZpabzaSAHuoOAcRsvYYHniREvwK/NUjhAKAHQaj+uW3T0NNc7FcIVPMw
	 2e/NBfYgfInY4LWCIgRFxTiC6UsECFGFllXrsoq9AgwqTnKb/oHUJi74oYyl90X7wWs3I
	 VtkDKn+JeYQPfR5AIc/+gtFU7QFOrm1v8FWglF1E1qb0+tVdOLh0GwwyFgxuby7q0ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ted9K+BkkR+QFgGVq+0shrkHjbI13xF98LTrYp6FnvQ=;
	b=IBBtmZ+WBD/ZZMAWQcHnKf5lOlMx+QEhw75l9bZObNbI28qscO35uY6brIveclys/TKT
	 G8dE6yC1/wVKUDfMToLs6GNhD3pa8kKqpmnkgiso986JlVoSHQnxc464xwgvFIaZc7OeE
	 LO9XEuAUopSYUv4SfnsmEte3DVWapsnEOGEiLjSa5kVGsiI0ElZaekVvcnvfAKjEHU68x
	 sgZiuHDSumMCWMSClS9LhzpYOS03GEKTQKSZjiDdlcqTrflvh/Kl5teDOoO8Co0s1ntjw
	 sRRfhyMT9+2x0WoNwWtjPqRdqqgcsjLGX08qfGpCDXKBCNU0BL3Jpd0hbPUxDOYqyGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bgoEndZk;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959B1606A326
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 03:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 959B1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bgoEndZk
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-980c4258105so1460033241.2
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 20:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986652; x=1793591452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ted9K+BkkR+QFgGVq+0shrkHjbI13xF98LTrYp6FnvQ=;
        b=bgoEndZkN9fkR27nyqnJSB3dhN9Hb4U4YEZXWXpAf4cTjnzpePbgGWSR6sCtvA/8ap
         FUzz1YfOO3wgdAJdx8BwfsFoUYbjfZ9YdtaM/IiI29/72wKYK+5MTjkgEjqfjXzdsNxl
         qXSU8gfDzi/9YpH/YBmmneTvwHCaMemvoorn+fEQouM9CmIitkpIPSLV4hVrB2f8qlqS
         mmQie63L5jQFp32KafvOa8r63H+nZklKYvj/uO4J1VdqqwkVJiYqkgXv9iFMP/Z11aBD
         6Jbhyx2MDcjrD5KKLPjqz1uWIorzJoXbvQ1TxTlZzK6/RCKZtAkxpIZ07xL0LVBpovyi
         fFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986652; x=1793591452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ted9K+BkkR+QFgGVq+0shrkHjbI13xF98LTrYp6FnvQ=;
        b=GpWsVhYidWz4UEKQ4aIACAjye7LGSf+fyP7ngKJVNPucQrjuk0o35ifuKabOJFZhJZ
         rn/9xwI9jNXtbU4IJtUFhig1CKP3AZVxL1eYurV78tkYaTt6DhUrPn9p3F+LmKxEmgML
         aknA389QHXhSBGN7J/pmQxjwJCdeL8hb4xdsMJ6eRz3o7FZsZbS0eZbZnWIWX0FvOi9J
         rM9OPVnpoUb9vhzr5krcVvqAgXMUOlE1xwQwxoppnwLCodEL/xWgnfdKG8IK9V3O13vS
         iO0U7wfG6IOHIGR1f0vN9gsdj666y5y8afLaZJ8C0SzRB4ZyYomuDHmEyHFVH2kCW5S6
         6PSw==
X-Gm-Message-State: AFq9FYLysnuW9yDTKwhxKdgRKbWd93XXgP0CIZNLOAtUm/1WD3YW8fRl
	Yq9MJql9XXu6XBx0alu4Ih7EERNIQisWAf7PD8mqgMoy/o9NGoQx5r1M/J3L7QSB
X-Gm-Gg: AYBFou2FOSBr6EnjbqmPb4gC3PT/NCWFT5d9mQ0+4xDEnMO4ctQvCcqHsOM0/GafKp2
	o5eMo7iaJeqh0uDfm64YXz+XvyMMePKxjPy25B7xnp4MGDaEqB02ZhfHc4W2vWhOZc9OtuJyW2i
	E/oWYTGb5gk2Jpq4+uuqqL4gRrtzcL8cdUUrWfr0RziG9aABZL3rhW9r8uGcbT+ecTVBAu4GgL/
	QmUQMI40ML7Hz6vI8inLZ4i30acaagt9NgtmJHdatXwWZzSuQmmcZGrijiQDS4wyYT1ySf523Dd
	x3jTH24IvfhF+Ovv4Los02lcCifrsdLQo1v7llQiVb0cUWm4WLKuzyxri9IY94knZHPsIvSilXl
	mVipsNeo/xGLaYLd/TTv6UH3nRJM+6o6HGXammA9IBTqlEgKjzd+BdKLkY45CTpe3t7KyLIhi5m
	zabuern89PJXIheZtZ3rx40fe0b5y86TfmYoYVwEWLfSlcinL4tX/F9cGFBidZH4w2pSYjdJ2tr
	pLYWOqR9fFDjZmCo0ukoj2p9tKFfq7rO4pykOkzMl6MqubW6k8qhu3X9q2CXD+6EVh3xengzzf1
	XW7g9Dsw6gejUp97MwlN
X-Received: by 2002:a05:6102:2925:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7ce5cc37a74mr1759413137.8.1792986652638;
        Sun, 25 Oct 2026 20:50:52 -0700 (PDT)
Received: from archsung (187-126-110-245.user3p.vtal.net.br. [187.126.110.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e2baf56sm6140100137.11.2026.10.25.20.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:50:52 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v4 4/5] media: ipu-bridge: Add the OV02C10 26 MHz link frequency
Date: Mon, 26 Oct 2026 00:50:14 -0300
Message-ID: <20261026035015.110903-5-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035015.110903-1-calliarifelipe@gmail.com>
References: <20260923234100.318151-1-calliarifelipe@gmail.com>
 <20261026035015.110903-1-calliarifelipe@gmail.com>
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

With a 26 MHz external clock the OV02C10 runs its CSI-2 link at
399.479167 MHz instead of 400 MHz. Add that link frequency to the
OVTI02C1 entry so the sensor driver can use it.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---

Notes:
    Changes in v3:
    - New patch. The ov02c10 now advertises the 26 MHz link frequency
      on its own (Sakari), so the bridge has to list it.

 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a..9124abefb 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -95,7 +95,7 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),
 	IPU_SENSOR_CONFIG("OVTI01AS", 1, 400000000),
 	/* Omnivision OV02C10 */
-	IPU_SENSOR_CONFIG("OVTI02C1", 1, 400000000),
+	IPU_SENSOR_CONFIG("OVTI02C1", 2, 400000000, 399479167),
 	/* Omnivision OV02E10 */
 	IPU_SENSOR_CONFIG("OVTI02E1", 1, 360000000),
 	/* Omnivision ov05c10 */
-- 
2.56.0

