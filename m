Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4640B6EE
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791647793; cv=none; b=BBNERTFvTz+nuorzYtIc8wrPONyPY74JmvIZ8lTx09WcF9uMOWopTaKbXkqPpRmcyRlWvUaaRdq4uYPm6kef0rVCteksuXdpp/H7yovAwrl3X17Dgs7FHgyTpKubTXGbLhQFf1uFTQJipg2UGLUJwmXKr3ggdbYdfc3jj6Wg91s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791647793; c=relaxed/simple;
	bh=npdWyanDV8QDZz7RLjwAwospzvkB0oAb68MAX+mIyeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQ/ffCFRzBL1siF9rcSxePvE9ZbW9BYLjHh2BuaYR7wyUnk/fEs713kAz1tmzt+TFQPaRjujrtQQmJoGWAMDYhfsuDyuXbL4NnzrhggjNhsxW11WEEaRgtwfWWLfpSbXAkZQqpF1uI4nv7Cq21MKOIkvQWInyUxha+xPJewH4o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7+k3SpE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7+k3SpE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a166199820so3777685e9.1
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 08:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791647790; x=1792252590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFJSf5/KGtnTTz/mkLnowALQmtn8ybSGn7v3oqfC7EQ=;
        b=J7+k3SpEredF11zGCuGHKryB6vcz44IpKHcR2Qm2XMsXu7JsvbetNyjbcm/Xt/zGot
         AgEFLhs7exQ5tUA9ARaXRMWD4gXvZ7ac2claB05pXey/bvEpvRaS+AGaaQboqz/0rf4A
         N2+5AV3sFWW6niDkxOVXAjhgLiK0G8sj90KprQNakl53qX52WFvXmkpA8zRYy39Jza+t
         m5DCv1MbejpR3vn+m21tbCmOOIUjxnpAGABMvd9Jk6XOGUuGZcMRkRL7k7eREQN3mdGf
         +dq8XTjF1XTAVrrYSFOkQ7RRH5DEwUsRexBQEd/ffTHvFBCN2PwoyAOre+RUWKLVspzp
         LPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791647790; x=1792252590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFJSf5/KGtnTTz/mkLnowALQmtn8ybSGn7v3oqfC7EQ=;
        b=J+qfv2ztGYEl++AaigmsvgvoIy4l5Jiq5ptk3QqDmqFE8hnhim5hfcEH2vjmITHd7r
         AGDOJMN+hgZ2Rd2s1S89Pej4L7x+9aFRENS3q45nZelgTpyjYfHVsGk13umbeclq3dAl
         wBY+EpDz7Cf56wVqId6YQp90vqZU2UMb5GD7jvBVcztNO7FT3EVncLDwz7sAs8f06qdi
         KKOvvjAecj5uTuK2N3o6i1GvkBaZanVGFTWZLVnpO7mQKstWcKPhRjegGqrkPwbXrfU5
         IOcqztc6cHvJDNDnAHiHuF+DaWmXjO7bkFOHkokxU3TrKKxHeRQQqnWz1KSy0ta1xEs3
         sqjA==
X-Forwarded-Encrypted: i=1; AKwUvBx2cHNTKdLaRKky45mysQ/ia82x10IugZQ/DE3zNBz1SbTZKqPh9Bd6DX81Pj6mVA238cSi0OCKoXESQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYILzMG5P+ZDeksQSC5ScoyrKYp8h8JFCnF9hGav/7+4dvf/tXMh
	KT4XIn8Ru8SeAZsyNgNZ/2kmRtk17a/jXl7xgiAnMBzvD/1rwz7x7jg=
X-Gm-Gg: AYBFou0fUW+Fq6eJpzd8rNH80lPQB/PVNoI/iQzgsTfdAYJiLqFfs0ajoT+0XQ9hhor
	jLtvhkZfr8ddXHm71EdOXDwkPAGBoPYgtug6/FzaOzYwatNHW7tfp81ct5clMeXPDM08hmspD7b
	JRuZ+xAOlzT2X2WfTjYwBEj4Q6Vrqx75fySN2f85Zn+IT6fnWu7vvv+qEj8wLrh81B+NGGAn1bX
	Dc0tUOPBAO2WXvSqOGi0DefhIedax66euNYsjy1qd6hsbTRKOTqpDDcsHK4SaodlmHzBe8K6F+O
	aD/dMNXKywHMeoO3gCBJzjuIEj0cXqKjM06LS4JKJ/qCs0C+wLLuw57n+auQ8OPMwS79p4DNtFF
	98iuRT9B7BKGM1a5KV9jQsSiTSAbEK9n3S6x3V2PvpUA2S6WP1Vfmvvvixl/MHzHTmc+X3vsn02
	8iFT2yS8njtfeWLCcr6oPzj6O4/YZDHmojDZo6hYmBIypMphwt7KINfgcR+L3vJMCmV9+eFilsy
	d+9amE6IkbyqA9XIYv5NsMhZg/OCSljNv3tNvuKtm+HqxkCRN3c75+B
X-Received: by 2002:a05:600c:8b78:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a18e4837f2mr91486795e9.5.1791647789702;
        Sat, 10 Oct 2026 08:56:29 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm138023065e9.14.2026.10.10.08.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 08:56:29 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] media: ipu-bridge: reuse the software nodes on rebind
Date: Sat, 10 Oct 2026 17:56:26 +0200
Message-ID: <20261010155626.2766298-3-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010155626.2766298-1-dmanresa@gmail.com>
References: <20261010155626.2766298-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The software nodes are deliberately never unregistered so that a rebind
can reuse them, but ipu_bridge_init() only takes that path when the IPU
kept its secondary fwnode link. Removing and re-scanning the IPU PCI
device clears that link, so the next probe tries to register the IPU HID
node again and fails:

  sysfs: cannot create duplicate filename '/kernel/software_nodes/INT343E'
  intel-ipu6 0000:00:05.0: Failed to register the IPU HID node
  intel-ipu6: probe of 0000:00:05.0 failed with error -17

after which the cameras are unusable until reboot.

Look the registered node up instead and restore the device's secondary
fwnode.

Assisted-by: LLM
Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index aea4699..a77ea60 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -1098,6 +1098,7 @@ static DEFINE_MUTEX(ipu_bridge_mutex);
 int ipu_bridge_init(struct device *dev,
 		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode)
 {
+	const struct software_node *ipu_node;
 	struct fwnode_handle *fwnode;
 	struct ipu_bridge *bridge;
 	unsigned int i;
@@ -1108,6 +1109,22 @@ int ipu_bridge_init(struct device *dev,
 	if (!ipu_bridge_check_fwnode_graph(dev_fwnode(dev)))
 		return 0;
 
+	/*
+	 * The nodes registered by a previous bind are still there, but the
+	 * PCI remove/rescan cycle dropped the IPU's secondary fwnode link to
+	 * them. Registering them again would fail with -EEXIST, so reuse
+	 * them and restore just that link.
+	 */
+	ipu_node = software_node_find_by_name(NULL, IPU_HID);
+	if (ipu_node) {
+		fwnode = software_node_fwnode(ipu_node);
+		set_secondary_fwnode(dev, fwnode);
+		/* The node is never unregistered, no reference is needed. */
+		fwnode_handle_put(fwnode);
+		dev_dbg(dev, "Reusing the previously registered software nodes\n");
+		return 0;
+	}
+
 	if (!ipu_bridge_ivsc_is_ready())
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "waiting for IVSC to become ready\n");
-- 
2.43.0

