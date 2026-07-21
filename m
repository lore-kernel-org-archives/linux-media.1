Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EE73546EC;
	Tue, 21 Jul 2026 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640356; cv=none; b=CUaeqNjskMntOm64amXQfshi55iiiEbTTqeyE7XRYA1i/A1uUPYyl2Agu2v/IIWnx8vF8TYMz9+FwR1WFrA74XAyUzZ6HFR87tb1l38NUbvCxbLNZrFIfOQ2ETod8drnbE84VCGlwwUW8E1roZUnuJjtPIlorzanZfGvTsuO42o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640356; c=relaxed/simple;
	bh=ugVEoD7zwl1bbihPti6RaOArdqZkCFDAWPSM9jzL53c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B0t4uzbIChmVtdWABgo/rW19PPmL6qEGmNEBauAR0vLiVGHdpZOi2SDiPS+SZc9PGfLBeVv3l1uGf/setMIPXwL0UnrhWSNRN9TbNTcMmyM9/svSzMEfanViGQEiomdmwm/6AsoFidpRWr8OzDHP8fpWjx/aH7P51b44FqBL9cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I4db5maa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I4db5maa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C54FC2BCC7;
	Tue, 21 Jul 2026 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1784640355; bh=ugVEoD7zwl1bbihPti6RaOArdqZkCFDAWPSM9jzL53c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I4db5maawhZGExoGwae/IOq8aOeYIsc2iY71tWCVBtmO2Mz/BbjFvLPuho8x0G/b6
	 0yvMImrkU6qMOkCaAiVF0pWULbSwNkscNAWUOVGCN9t7xuc2GQTGaktHPO1J+1syq4
	 i4TY7wmSpntfjFxznrSsD4fui9/IHNKt76LCx3Vw=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4C0C44532;
	Tue, 21 Jul 2026 13:25:55 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 21 Jul 2026 15:25:28 +0200
Subject: [PATCH 1/2] media: v4l2-cci: Add support for custom regmap
 configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-cci-single-v1-1-8485171e1393@linux.dev>
References: <20260721-cci-single-v1-0-8485171e1393@linux.dev>
In-Reply-To: <20260721-cci-single-v1-0-8485171e1393@linux.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784640354; l=4677;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=ugVEoD7zwl1bbihPti6RaOArdqZkCFDAWPSM9jzL53c=;
 b=SI4foG9zLBL8u2AePY1XlkE8pH8li4kMsRKTN2jiL7TjzfjEGsFzC8jkv4d9PjIQsxNJXKpHL
 GAe34kj/SxoC+3j53TGXBGfx8PQTHUjO4bpEzg+rmERRWVK0oPoCEb5
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Some sensors, e.g. OV9282, require custom regmap configuration like setting
use_single_read. Therefore introduce a new custom cci configuration
struct, which exposes optional transport-specific regmap configuration for
I2C devices using the cci_*() register access helpers.

The existing devm_cci_regmap_init_i2c function is changed to use the
newly introduced devm_cci_regmap_init_i2c_cfg and its return value
documentation is fixed.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/v4l2-core/v4l2-cci.c | 23 +++++++++++++++++++----
 include/media/v4l2-cci.h           | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
index e9ecf47859465..584ca080bc6e5 100644
--- a/drivers/media/v4l2-core/v4l2-cci.c
+++ b/drivers/media/v4l2-core/v4l2-cci.c
@@ -183,18 +183,33 @@ int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequence *regs,
 EXPORT_SYMBOL_GPL(cci_multi_reg_write);
 
 #if IS_ENABLED(CONFIG_V4L2_CCI_I2C)
-struct regmap *devm_cci_regmap_init_i2c(struct i2c_client *client,
-					int reg_addr_bits)
+struct regmap *devm_cci_regmap_init_i2c_cfg(struct i2c_client *client,
+					    const struct cci_regmap_config *cci_cfg)
 {
-	struct regmap_config config = {
-		.reg_bits = reg_addr_bits,
+	const struct regmap_config config = {
+		.reg_bits = cci_cfg->reg_addr_bits,
 		.val_bits = 8,
 		.reg_format_endian = REGMAP_ENDIAN_BIG,
 		.disable_locking = true,
+		.use_single_read = cci_cfg->use_single_read,
+		.use_single_write = cci_cfg->use_single_write,
 	};
 
 	return devm_regmap_init_i2c(client, &config);
 }
+EXPORT_SYMBOL_GPL(devm_cci_regmap_init_i2c_cfg);
+
+struct regmap *devm_cci_regmap_init_i2c(struct i2c_client *client,
+					int reg_addr_bits)
+{
+	const struct cci_regmap_config cci_cfg = {
+		.reg_addr_bits = reg_addr_bits,
+		.use_single_read = false,
+		.use_single_write = false,
+	};
+
+	return devm_cci_regmap_init_i2c_cfg(client, &cci_cfg);
+}
 EXPORT_SYMBOL_GPL(devm_cci_regmap_init_i2c);
 #endif
 
diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
index 4e96e90ee6369..8296a8c122b4d 100644
--- a/include/media/v4l2-cci.h
+++ b/include/media/v4l2-cci.h
@@ -27,6 +27,27 @@ struct cci_reg_sequence {
 	u64 val;
 };
 
+/**
+ * struct cci_regmap_config - Optional configuration for CCI I2C regmap creation
+ *
+ * @reg_addr_bits: Number of bits in the register address.
+ * @use_single_read: Force single-register read transactions.
+ * @use_single_write: Force single-register write transactions.
+ *
+ * This structure describes optional transport-specific regmap configuration for
+ * I2C devices using the cci_*() register access helpers.
+ *
+ * The CCI helper initializes the underlying regmap with the CCI defaults:
+ * 16-bit or 8-bit register addresses as selected by @reg_addr_bits, 8-bit
+ * register values, big-endian register address formatting, and disabled
+ * regmap locking.
+ */
+struct cci_regmap_config {
+	int reg_addr_bits;
+	bool use_single_read;
+	bool use_single_write;
+};
+
 /*
  * Macros to define register address with the register width encoded
  * into the higher bits.
@@ -123,6 +144,20 @@ int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequence *regs,
 			unsigned int num_regs, int *err);
 
 #if IS_ENABLED(CONFIG_V4L2_CCI_I2C)
+/**
+ * devm_cci_regmap_init_i2c_cfg() - Create regmap with a custom config to use
+ *                                  with cci_*() register access functions
+ *
+ * @client: i2c_client to create the regmap for
+ * @config: Configuration for CCI register map.
+ *
+ * Note the memory for the created regmap is devm() managed, tied to the client.
+ *
+ * Return: a pointer to the regmap on success, or an ERR_PTR() encoded error on failure.
+ */
+struct regmap *devm_cci_regmap_init_i2c_cfg(struct i2c_client *client,
+					    const struct cci_regmap_config *config);
+
 /**
  * devm_cci_regmap_init_i2c() - Create regmap to use with cci_*() register
  *                              access functions
@@ -132,7 +167,7 @@ int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequence *regs,
  *
  * Note the memory for the created regmap is devm() managed, tied to the client.
  *
- * Return: %0 on success or a negative error code on failure.
+ * Return: a pointer to the regmap on success, or an ERR_PTR() encoded error on failure.
  */
 struct regmap *devm_cci_regmap_init_i2c(struct i2c_client *client,
 					int reg_addr_bits);

-- 
2.53.0


