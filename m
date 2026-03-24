Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9333E95B6;
	Tue, 24 Mar 2026 10:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348931; cv=none; b=VIAXJQOibaPFcQMwo12UwFA/kx4QbYhQuIMC5HLkBKko55/elRyYWV40Yidc/L0Fd5vSbaa8txtCNyESa52MouLca/x+AL1k4nIPzB9UHTPuxtm9MRGwjkkqhFwl3s/qQKHmDIFJQQPt1wi66XNNzX4qsT5Gl4caS5vs77Ogdhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348931; c=relaxed/simple;
	bh=ohg4vOAqnmp6jKcSARC0EGRVirl7CfsZWO9r9TKQeGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eBfKJCvpjeDPx++mAtCs5idlj2Lk6JSQmQjEQSArFIR/8sqFZjS1VrxdCVER9YHUaAV8HgWfcTamc3qWlyIbPAqpFFX1xl3JsVlxGQJi3G8+xMdW/1zTVTN0zUv+lN5JvCWzHZyjqLMPVw4xGxIgMpTj6pSkCIg89nS9DgzicS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=FFDj8bMP; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="FFDj8bMP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uDqJ+5X22HEssjSzJwK+VACNwW1maLafgmcOYMRW++k=; b=FFDj8bMPgDtqN0rydorsT8qP1m
	G6w1D6KfDa2toskDxN/hF+LhSANpiDN3xIDzdlWiMMlkzp14naya1TKAyCQ3kImRI/irqq25u8cgw
	6vbDHa412isLf/T6GOQzbmWrXrQ9DH7ug5A/ghbDgg+uE61iKP4TQG+Z7R8pRGxX8Fw8=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:55336 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1w4zD4-00DIvK-Hh; Tue, 24 Mar 2026 11:42:06 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Tue, 24 Mar 2026 11:41:41 +0100
Subject: [PATCH v3 7/9] media: i2c: ov08d10: add support for binding via
 device tree
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-ov08d10-v3-7-1e44069cf91e@emfend.at>
References: <20260324-ov08d10-v3-0-1e44069cf91e@emfend.at>
In-Reply-To: <20260324-ov08d10-v3-0-1e44069cf91e@emfend.at>
To: Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: -0.7
X-Spam-Bar: /
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Add bindings for the Omnivision OV08D10 CMOS image sensor.
    Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> Signed-off-by:
    Matthias Fend <matthias.fend@emfend.at> --- .../bindings/media/i2c/ovti,ov08d10.yaml
    | 101 +++++++++++++++++++++ [...] 
 
 Content analysis details:   (-0.7 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 URIBL_DBL_BLOCKED_OPENDNS ADMINISTRATOR NOTICE: The query to
                             dbl.spamhaus.org was blocked due to usage
                             of an open resolver. See
                             https://www.spamhaus.org/returnc/pub/
                             [URIs: devicetree.org]
  0.1 POISEN_SPAM_PILL_3     BODY: random spam to be learned in bayes
  0.0 URIBL_ZEN_BLOCKED_OPENDNS ADMINISTRATOR NOTICE: The query to
                             zen.spamhaus.org was blocked due to usage
                             of an open resolver. See
                             https://www.spamhaus.org/returnc/pub/
                             [URIs: devicetree.org]
  0.1 POISEN_SPAM_PILL_1     RAW: random spam to be learned in bayes
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.1 POISEN_SPAM_PILL       Meta: its spam
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)

The OV08D10 can be used also on embedded designs using device tree so allow
the sensor to bind to a device tree node.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index f2276f49506028c582e49a5b7cab3b07f6ca4e0d..ce0fa30a86129302b5dda0b8796e44054fd77c88 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1464,10 +1464,17 @@ static const struct acpi_device_id ov08d10_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, ov08d10_acpi_ids);
 #endif
 
+static const struct of_device_id ov08d10_of_match[] = {
+	{ .compatible = "ovti,ov08d10" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov08d10_of_match);
+
 static struct i2c_driver ov08d10_i2c_driver = {
 	.driver = {
 		.name = "ov08d10",
 		.acpi_match_table = ACPI_PTR(ov08d10_acpi_ids),
+		.of_match_table = ov08d10_of_match,
 	},
 	.probe = ov08d10_probe,
 	.remove = ov08d10_remove,

-- 
2.34.1

