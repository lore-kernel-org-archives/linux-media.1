Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C88333F5B3
	for <linux-media@vger.kernel.org>; Sun,  2 Aug 2026 20:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785704360; cv=none; b=Unl0WzxPmR5brRrGqFWvKTd7oiqfK98h+HHnHkfKYopU2QdPa98g7cz6NXRKWf6JfZak2tQ7WmMXkOVCgYflE8q7rIKPWk3JoGDw3J+vquW6tNHJkjSoIBBG274CgMP3eTuRTTxa6941QqnDSjDBMk04xiwRBlBjg7Bbpk8CU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785704360; c=relaxed/simple;
	bh=h7SVIjYHGVfGV8PFjeXqyhICXUHvpJQxQJjkc5FaQE8=;
	h=Subject:From:To:Message-Id:Date; b=DVJ7uUP1A4CFUy8618OBgb1uq9spMNQOddqsdF1qJNvPwluHqn4Zj+4jb9MRWCL8KV3TK6GDLzvLEWbzqwVfW5elWy6qEypZI2btemXOKghz/wT+fqN9KK7jpZ2zKtusBRaGuHcvD2PrxISZjdURLy1K9ceNMxGe7fDL8+LQ0LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=A8McwoAT; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="A8McwoAT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Date:Message-Id:Reply-to:To:From:Subject:Sender:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RRfqXt7VRhmmwQfG8v0XbVlwBhACZ+3qwMo0ycah89E=; b=A8McwoATcyOS1CW9J/en3MfNz5
	+F2v4L1NW+iqki64IljVBgDgkrsW9JjeJZdnMHg/SQYBFws3a6HnWUTpKLQxtow37cUqiiGezNMXV
	JZLmdSbQNv/UVJbZB4c+SyXQ8xMbs3XaP56Ltx/wJq63OQ10kkF9uLsIvPw1Cz95r9tKxxf887zaO
	QmXMqtnQsZmilTksbztMCNfUQ+QrSUDaqgzocwzhuFUKIXS1H/HNynF2xVjZ2VzzWP5AU8ClFhMfe
	qmeAFl/cCmND2n2IUOJclfwVIw8t9RxdTpP5By5+qNAYRZnPnHjsZYqKEvbl3fD+oLw1mz8caWW4h
	3jnMMKaw==;
Received: from mchehab by linuxtv.org with local (Exim 4.96)
	(envelope-from <mchehab@linuxtv.org>)
	id 1wqdDW-0004NH-2H;
	Sun, 02 Aug 2026 20:55:30 +0000
Subject: [media.git/next] platform: int3472: discrete: Support multiple HIDs per GPIO map entry
From: media-ci@linuxtv.org
To: Hans de Goede <johannes.goede@oss.qualcomm.com>, Tarang Raval <tarang.raval@siliconsignals.io>, linux-media@vger.kernel.org, Daniel Scally <dan.scally@ideasonboard.com>, linuxtv-commits@linuxtv.org, Kate Hsuan <hpa@redhat.com>
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1wqdDW-0004NH-2H@linuxtv.org>
Date: Sun, 02 Aug 2026 20:55:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

On Wed Jul 29 11:28:00 2026 +0530, Tarang Raval wrote:
> Each int3472_gpio_map entry currently maps exactly one ACPI HID to a
> GPIO quirk. As more sensors needing the same quirk are identified, this
> means adding a full duplicate table entry per HID, differing only in
> the HID string, which does not scale.
> 
> Change int3472_gpio_map::hid to a NULL-terminated hids array so a
> single entry can match any number of ACPI HIDs, letting new HIDs be
> added to the relevant array instead of duplicating quirk entries.
> 
> Cc: linux-media@vger.kernel.org
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> Tested-by: Kate Hsuan <hpa@redhat.com>
> Reviewed-by: Kate Hsuan <hpa@redhat.com>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Patch committed.

Thanks,
Sakari Ailus

 drivers/platform/x86/intel/int3472/discrete.c | 59 ++++++++++++++++++---------
 1 file changed, 40 insertions(+), 19 deletions(-)

---

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index adff564bf3fd..6c729fcfce5d 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -123,10 +123,31 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 	return desc;
 }
 
+/*
+ * Other vana-supply users (e.g. ST, Toshiba, Sony sensors) can be added to
+ * this array instead of adding new quirk table entries.
+ */
+static const char * const power_enable_hids_vana[] = {
+	"SONY471A", /* imx471 on Lenovo X9-14 and X9-15 */
+	"TBE20A0", /* imx471 on Lenovo X1 Carbon G14 */
+	NULL
+};
+
+static const char * const power_enable_hids_vdd[] = {
+	"INT33F0", /* mt9m114 */
+	NULL
+};
+
+static const char * const power_enable_hids_enable[] = {
+	"INT347E", /* ov7251 */
+	NULL
+};
+
 /**
  * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
  * sensor driver (as in DT bindings)
- * @hid: The ACPI HID of the device without the instance number e.g. INT347E
+ * @hids: NULL-terminated array of ACPI HIDs of the devices without the
+ * instance number e.g. INT347E
  * @type_from: The GPIO type from ACPI ?SDT
  * @type_to: The assigned GPIO type, typically same as @type_from
  * @enable_time_us: Enable time in usec for GPIOs mapped to regulators
@@ -135,7 +156,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
  * GPIO_ACTIVE_HIGH otherwise
  */
 struct int3472_gpio_map {
-	const char *hid;
+	const char * const *hids;
 	u8 type_from;
 	u8 type_to;
 	bool polarity_low;
@@ -145,38 +166,27 @@ struct int3472_gpio_map {
 
 static const struct int3472_gpio_map int3472_gpio_map[] = {
 	{	/* mt9m114 designs declare a powerdown pin which controls the regulators */
-		.hid = "INT33F0",
+		.hids = power_enable_hids_vdd,
 		.type_from = INT3472_GPIO_TYPE_POWERDOWN,
 		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
 		.con_id = "vdd",
 		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
 	},
 	{	/* ov7251 driver / DT-bindings expect "enable" as con_id for reset */
-		.hid = "INT347E",
+		.hids = power_enable_hids_enable,
 		.type_from = INT3472_GPIO_TYPE_RESET,
 		.type_to = INT3472_GPIO_TYPE_RESET,
 		.con_id = "enable",
 	},
 	{	/* ov08x40's handshake pin needs a 45 ms delay on some HP laptops */
-		.hid = "OVTI08F4",
+		.hids = (const char * const[]) { "OVTI08F4", NULL },
 		.type_from = INT3472_GPIO_TYPE_HANDSHAKE,
 		.type_to = INT3472_GPIO_TYPE_HANDSHAKE,
 		.con_id = "dvdd",
 		.enable_time_us = 45 * USEC_PER_MSEC,
 	},
-	{	/* imx471 expects "vana" as con_id for power enable */
-		.hid = "SONY471A",
-		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
-		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
-		.con_id = "vana",
-		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
-	},
-	{
-		/*
-		 * imx471 (on Lenovo ThinkPads X1 G14) expects "vana" as con_id
-		 * for power enable
-		 */
-		.hid = "TBE20A0",
+	{	/* Sensors which expect "vana" as con_id for power enable */
+		.hids = power_enable_hids_vana,
 		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
 		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
 		.con_id = "vana",
@@ -184,6 +194,17 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 	},
 };
 
+static bool int3472_gpio_map_hids_match(struct acpi_device *adev,
+					const char * const *hids)
+{
+	for (unsigned int i = 0; hids[i]; i++) {
+		if (acpi_dev_hid_uid_match(adev, hids[i], NULL))
+			return true;
+	}
+
+	return false;
+}
+
 static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
 					    const char **con_id, unsigned long *gpio_flags,
 					    unsigned int *enable_time_us)
@@ -200,7 +221,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		if (*type != int3472_gpio_map[i].type_from)
 			continue;
 
-		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
+		if (!int3472_gpio_map_hids_match(adev, int3472_gpio_map[i].hids))
 			continue;
 
 		dev_dbg(int3472->dev, "mapping type 0x%02x pin to 0x%02x %s\n",
