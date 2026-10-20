Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461052;
	b=T7LdT5km8MAevG/lnUEq322milrn+d4NkO8G991gEFzeYFN+4qhZjup2Ca+XVxKjdsR5
	 hzSRrqU3//+gEEO9ncZmqSlep/5/L2MoW9X/0h8iFdQC9Hm2AP2t90jmmUXYkF8Y+6fBu
	 +EVH3xeYPapz5z7BGILsqcsSSE0ozDdJdW38qpQ5uVZrWRNCTXrtqpyFxjIMNf7yyhjOo
	 wQxzvhHfsxykFyyQC9glbUpd/JzXysceqizUA/3WPQutgXd2wFDm0+btxEkohJP+yZux9
	 jELr951zMr3zpyQMF4EBAfJ/jsS6ur9XVHGHfdB08ofQppDzH43MIO8OU4f3meVYVug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i9aUqDIrjTg11FxtvMxwLtqkPo8X0vvuUAjHwNJSvjA=;
	b=SdmRvOB3juMqWMjCWJQh66xv0J2yJgw/aM9LQIU74oI70yH96pc2eHOOu6I/omYPUPyz
	 hfXzMd/u2ozN/k8e2jvrBfpSM3KIRt5qGrHzPHxsASAysuscjq8BAO2A5kEPNbFonVjwd
	 5qcuG1FNyOUYTyT6kNoIWNOxdRQs2FkklQY4QHGb3cAUH81/8Ake6TfcQhoOKO2VIVdLH
	 pMolIYSflOn0KPursK8UHjvd2FyT9E6skyLmThNo63IJAtb4VhUD/3ub0I99KcMeu8mux
	 lU+MJrHgcK8n1BYAbm2MB+N46mVp9wSuowUTxPCAt4TtYwt8c+x3PHaKFYIank42KOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AdYzHh01;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E06606A31A
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 01:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E06606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AdYzHh01
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35d0be18c71so274127eec.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 18:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461051; x=1793065851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9aUqDIrjTg11FxtvMxwLtqkPo8X0vvuUAjHwNJSvjA=;
        b=AdYzHh01iwEZTKTCiaHd7BEu8gwsPjXx+Nxxo1JWko+Itn8IDPOWk3XiFhlQCdhYZI
         q2diG58qoHBtwS1jzoxx+w4PnB+AP0OyK0uDULw0PzMzeMd6e3iiqOEOnQHIeFz1KFsE
         YGGUR6r8vlFky+5OQDSn2sONxbF9yOSZhavq5pDMsf+QqbN4Ntcx80Zut34DatuH1fqd
         NBKxz+1ReTirFCz1SF3vU5xDRUo8S+bdjIbzwTss+upaHqPlWRP1T+4LNp+s5l14lrE/
         opWIN85XDtdhqZz5UCJf2Gp06x0qBksA7joPd9WxHmZh/qLc1H/k5zm9ouxGG7DS9EJe
         wbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461051; x=1793065851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9aUqDIrjTg11FxtvMxwLtqkPo8X0vvuUAjHwNJSvjA=;
        b=XMYEDRKDFFUyXQEhzEgaXaDqvy/9q0TBwItSNy0rnzhLYHPqJ4jvfhrRTEdQ5cb9eO
         60cm0Nz7iBXISN1Y+JV0/Ud8Vfikjze7hIec7Zwx2f+neat0HeTqbHZCDoiVGKzFDBCI
         zARA2DMS1IuohQj2lH4/cDFG4RPW9R9v+MvvtvYdAiW8xEQCQyuGgTf+fDiUw65AaCsl
         Dd9hKjTkrNeZAOCm5Qad7DtErDwoz0OA/CN/sMNAdkZmBTHWODUKkW/AjSrbn4QUF/MN
         uhx/SVJ9ZUmk46eyvkpD+ad3LZ4YmsfOzxnRxiDqcTts+rbGYseFOtwH4bTsoBmJxJ+A
         nuWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW65vvXv5llu+gS4FUkMfXsOkzcSn91ercwQCXng1v4A4QwMVKBLKDvCe0iEqtJ0pHCp/WubmLlkgKWg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+iBfkUby72aaeTG0NkymoKSyPOdhndZG08soKMpOsJpvbQ2PE
	z99w2P9dWLmxJ1sdmpFY5zQVc4p6Po41QHj1DLJKa6gpFt651RNBEz4I
X-Gm-Gg: AYBFou0LYZqFPXM6V5QujnRabl/aC9AZhH+qdAVZmRNP8LEjgpbXW4/UVq1Pw0T5Hf9
	V8P07M44c2/pYrrumIeV0mgH8E0IsFCRaKtQREJNyofyYTj19PdPaEG5jNC6azNVR/7QgJBTprz
	PFr25pczX6ekW05COjfKaCbFTcbcjAwJSUQ165pjBXo2b0+D8O27TfEoyDKbGP100hgvO+gvTdU
	nxUqhrovxb8OFgXTL/LBElK1P4wTiq4F805KOs+aaOyx8KNUR4oQ1MOuv3NgmmsNiKhb1wp/XBy
	MU3kcQ9LZ1c9anLwcI44mi890AkzAtJrV14+Fdrcc2nMw0h84s0ilh1tgNb25B7p21DlhINcXhb
	y+RkodTG7LS8v/knUFa17tyIK7fESJU4u6qjF7digqYIDrfku6FgyzhR7/96hjYHA4t3nHGq6J3
	8EQG6kNp58FeErlQKobJ5jM/0y+tAIinSzlvA+B88UO6bXMStzVucPlhWVzys4EsSiz3k++BJxv
	8CdiTG6bw+VEi6wWRGx2drP6FkpLYQnFbEEt1y715DMT65D1+ILA6ER
X-Received: by 2002:a05:701b:4244:10b0:181:6b8:31f1 with SMTP id a92af1059eb24-18dbf218557mr993067c88.10.1792461051185;
        Mon, 19 Oct 2026 18:50:51 -0700 (PDT)
Received: from duo.lan ([2001:fd8:f0db:3ee7:799b:69c2:e95b:f04e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm32684879c88.7.2026.10.19.18.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:50:50 -0700 (PDT)
From: Alexander Patrakov <patrakov@gmail.com>
To: johannes.goede@oss.qualcomm.com
Cc: adee.sahan@gmail.com,
	andy@kernel.org,
	antti.laakso@linux.intel.com,
	dan.scally@ideasonboard.com,
	diamondback@cohunt.app,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	Alexander Patrakov <patrakov@gmail.com>
Subject: [PATCH 2/3] media: i2c: ov5675: Defer the probe until the endpoint exists
Date: Tue, 20 Oct 2026 09:50:00 +0800
Message-ID: <20261020015001.15672-2-patrakov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020015001.15672-1-patrakov@gmail.com>
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com>
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

On ACPI systems the sensor's endpoint is a software node which ipu-bridge
creates when the IPU probes. Nothing orders that before the probe of the
sensor. If the sensor is first, there is no endpoint yet, parsing it
fails, and the probe fails for good: the camera is missing until the
next boot.

Return -EPROBE_DEFER when there is no endpoint, as ov2740, ov13b10 and,
since commit 437e1f6a9600 ("media: mt9m114: Return -EPROBE_DEFER if no
endpoint is found"), mt9m114 do.

This failure mode was seen once on a Lenovo Yoga Duet 7 13ITL6.
Reproduction efforts did not succeed.

Signed-off-by: Alexander Patrakov <patrakov@gmail.com>
---
 drivers/media/i2c/ov5675.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index c5eb07576129..9cf600c9c94a 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1182,8 +1182,16 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	if (!fwnode)
 		return -ENXIO;
 
+	/*
+	 * On ACPI systems the endpoint is a software node which ipu-bridge
+	 * creates when the IPU probes, which may be after this probe.
+	 */
 	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0,
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
+
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-- 
2.56.0

