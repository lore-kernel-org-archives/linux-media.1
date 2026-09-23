Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B58471D09
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153811; cv=none; b=e17BJnda9vhaX2plIP+IrlTWWvx+dBm4ACJul8/ffoNdMnfG7rp6xJ05MFLBFUFwkckt+4uDH/21z8DCijrrwulVsZ04EB7jOjvWu/eaVKuXw4KCi+zdqiqbvRNrerk4AwhoBl8Jc/GcDUq++m1Q18nLsGVmjQ2DZbUzTApjKkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153811; c=relaxed/simple;
	bh=mV9ORAgBdMpPApDm1IK9MCgif1G0n1RZCYLvFuNBpuk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=PM0GdMQEBiRyVcMxuiRG17BSS/v4oHnmuHRee4qcTTXDOjxhccgojNYImzZ6PG7K2gm2qQmTWDw0psoG2FAcMQcQeFeYVs53luxvgeAaeRzdWtxrdJ/7k8/QxmQpkQpADrCiip2Hao8JxSA6psgWGWuyFDD4SCn8iIaHYFF1BEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgEnd/HI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgEnd/HI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CFC1F000FF
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790153809;
	bh=tyfclVFCh7HQTaTd1EumkxJ2ZJ+nX76+uaywem1CHJ0=;
	h=Date:From:Subject:To;
	b=dgEnd/HIlNWd8+9TXCxNb8DMkBu6C1U0PD81ffOa+IBI8ML+bkft//2l9chDuqjFp
	 24xLDXumLQGD9utUKnuOu9ag6piNQVP1LNYPnfZGx3F5nbXf3KB7APjyV6a96VXd8Y
	 HLcgx7nt7CxWUnFNP3G4cSaHlGhkr1sFuOBrVBvFSzRWUR4WFtLCmECxBw+MdKDa8S
	 sfKcF4wxRcRD84Ar9CJJ61TluISTDDA5Pi9cX/yEthrnpLguGREpl7urfxWiRY/ZOc
	 AbCQj99VoWYRxAfWcZ9RinMzJqVfZxKHnSRM630a8jah8yMdjdZrf4kPoQz8PFprla
	 yDmthgZ62qbiw==
Message-ID: <41320fe2-0b49-49b9-bbe0-d7107f6f73cd@kernel.org>
Date: Wed, 23 Sep 2026 10:56:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] media: vivid: drop unused 'j' variable
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In two places the 'j' index variable was set but never used.
Drop it.

This fixes two compiler warnings:

drivers/media/test-drivers/vivid/vivid-cec.c: In function ‘find_dest_adap’:
drivers/media/test-drivers/vivid/vivid-cec.c:26:25: warning: variable ‘j’ set but not used [-Wunused-but-set-variable=]
   26 |         unsigned int i, j;
      |                         ^
drivers/media/test-drivers/vivid/vivid-cec.c: In function ‘vivid_cec_bus_thread’:
drivers/media/test-drivers/vivid/vivid-cec.c:116:25: warning: variable ‘j’ set but not used [-Wunused-but-set-variable=]
  116 |         unsigned int i, j;
      |                         ^

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/test-drivers/vivid/vivid-cec.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-cec.c b/drivers/media/test-drivers/vivid/vivid-cec.c
index 2d15fdd5d999..8d301578e2eb 100644
--- a/drivers/media/test-drivers/vivid/vivid-cec.c
+++ b/drivers/media/test-drivers/vivid/vivid-cec.c
@@ -23,7 +23,7 @@ struct xfer_on_bus {
 static bool find_dest_adap(struct vivid_dev *dev,
 			   struct cec_adapter *adap, u8 dest)
 {
-	unsigned int i, j;
+	unsigned int i;

 	if (dest >= 0xf)
 		return false;
@@ -33,13 +33,12 @@ static bool find_dest_adap(struct vivid_dev *dev,
 	    cec_has_log_addr(dev->cec_rx_adap, dest))
 		return true;

-	for (i = 0, j = 0; i < dev->num_inputs; i++) {
+	for (i = 0; i < dev->num_inputs; i++) {
 		unsigned int menu_idx =
 			dev->input_is_connected_to_output[i];

 		if (dev->input_type[i] != HDMI)
 			continue;
-		j++;
 		if (menu_idx < FIXED_MENU_ITEMS)
 			continue;

@@ -113,7 +112,7 @@ static void adjust_sfts(struct vivid_dev *dev)
 int vivid_cec_bus_thread(void *_dev)
 {
 	u32 last_sft;
-	unsigned int i, j;
+	unsigned int i;
 	unsigned int dest;
 	ktime_t start, end;
 	s64 delta_us, retry_us;
@@ -210,13 +209,12 @@ int vivid_cec_bus_thread(void *_dev)
 		if (first_status == CEC_TX_STATUS_OK) {
 			if (xfers_on_bus[first_idx].adap != dev->cec_rx_adap)
 				cec_received_msg(dev->cec_rx_adap, &first_msg);
-			for (i = 0, j = 0; i < dev->num_inputs; i++) {
+			for (i = 0; i < dev->num_inputs; i++) {
 				unsigned int menu_idx =
 					dev->input_is_connected_to_output[i];

 				if (dev->input_type[i] != HDMI)
 					continue;
-				j++;
 				if (menu_idx < FIXED_MENU_ITEMS)
 					continue;

-- 
2.53.0

