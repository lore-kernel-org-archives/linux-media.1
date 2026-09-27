Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5593D34F46F
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 20:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540199; cv=none; b=XCB6yqkav3vTN5E2e2EjuNOHLx9R0KBQFS9ygt3a3nNUU6SIOTY1mrB95/W5w2ggHIfe8aBctFy/so2ajbccXHwH14VxIj1AC178fRxhmHjY1DyLSKP4eFuI1kG6nrfRvwcMiVMoqaot6V5mvrzmh7tJplWr3GDruGZ1nFyYUw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540199; c=relaxed/simple;
	bh=Q/HV2llP7Jb38DEpJdoZVSsTLp6NrnzkhfOKfcleIRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jgoctnge7MbHjwP8v9VmYhQeuwymR7PBHe3WL5ocwkt5ihAGUFL7Fjmn7UYotyEJ+oYW39sAUsKmsaz35RXFvhaYAdD7PVPtAEXk+ae8YWqIi8ZPTmBrDoyDJia7XbOTFGuzDbdczwgs1iXy53WrKWo+UjDCImQFQuBYhddfaoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a00RYrE/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a00RYrE/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so27784275e9.1
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 13:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540197; x=1791144997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DwzM3O07KV7Ad57WiPSYsZ9aBNzLTCUxb/41TDBZ/+I=;
        b=a00RYrE/s0JxPQfU6HfiaXJW3Trb0hbuoAT6Y7irJYycHOojd7kbi7CWQKMLdfikiS
         BwTriYww9TFJcPZKmersngywvhtZHaO8KXWL/RaIoYxgQ/UIOPj4XOsgdxNT84qmNkXa
         03QoZgarabOHVg+TuB5871MH+C40FSrDsHB9wFLIbqUZ2g11ttQtnM4qSvEkSumk7LLU
         FfsPhgmpUNwI2xHtHHZoFzCAYNKW5qOsGUB67NYTUgQJJbLoUB65yaPjhXLpxQ12gSXr
         HUIVbMlt/mG+qkaKpkh/bQmpg2A3nH9pU4r/S2j2sRJHaf6VdZPpdc71sm4Yf7tik03/
         sOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540197; x=1791144997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DwzM3O07KV7Ad57WiPSYsZ9aBNzLTCUxb/41TDBZ/+I=;
        b=ljScoHSNYLwZ/N08QBAnEDYsm1+E3IUBTABlJKEq1XaGtnJtq11gW5Nx5COQ+IMAYg
         iJr37LLf655tJVrLPx9XDuNq2cI3TaZFU5ZxfwdEviTTJa6tc46XgQgmt6Tt/MXQg6QT
         6ZM7NFc6c/9LJlaM0NX0mpt2nZKMRiKnLkJ5qU8cGMQDwoCFOjROuy8EghkmMUiKfjlI
         k6L+2OnsqUXuLVjsv3r4l4KPBfAPC0gYgFXojPvypPQLZMD4IJueI6pgy89+iP3c6r0S
         ETHVYPRXibjyN2Sx5ssMRge6WFJkxwPyix6cD/YRc904zwTA2WbOJAQBPP+jyyaBIWET
         xQ8g==
X-Gm-Message-State: AFuF++lXZUX93K1nay4F3uyzbXHKbspD/v8H3Ag1mn5TCzeagVtJMOUt
	DH8ETcdMgum1lnN1hdzRKQZPr9+uSlKO8xbj3yFRWoad6rDwybJgPO0UYke6up/C
X-Gm-Gg: AYBFou1HlfHvVFruYnN5966WUpE59zpGfUqUoGdN2zzh+iu9h7KG9rRQa3AwBP3K3BY
	87EBMnc+1eUQhLDDdguav4013ZS92uaPyJboQOxor90/hKDYVI86o0XXDCcehp4sHaJekQCj8mi
	BRpPNhgpXTUhyxWQNFwGDujhfihIFszDfScJeDPgAUFIyAVItcLvm0Omozg8J7SkR28oeGCvkXY
	whVrxYvIvld9uECtZbMwNvmaVqqH0SEEYvCeJq9NTf4kksDCfHkbXs2/QqeVIfBBqm7GYK3SNEb
	c7LK5IVcOPm8a8gCsVk95rK9/9Iqoga45YCgkWje7Fteh5kBciMiGt+noYWIaS9HnGRoZhQEhRt
	7JIgvraZJr0Clu+nEcbbIoeXACU532CeFFkCRZwaMZGja4WTU4S+mgpxGgp0ZGIfzL+NapJYhc8
	AQIwAgOcd3D+9tYBSpV/69eSafzIy0QxfDqUQeh40gTQWCSQLyhddUp1wCj74GiRMzGXue4pRMj
	cX9jxS+Rk9nbMuCGoI4E0TR2Cvo+R5DMLgncsxX4Rd8mIYVtPDXreRblBw=
X-Received: by 2002:a05:600c:540e:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-49fe66ca828mr207735675e9.10.1790540196420;
        Sun, 27 Sep 2026 13:16:36 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ed6esm24576000f8f.29.2026.09.27.13.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:16:36 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 2/2] media: ipu6: Check the ipu7 output pin queue before completing a buffer
Date: Sun, 27 Sep 2026 21:16:31 +0100
Message-ID: <20260927201631.153126-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927201631.153126-1-devnexen@gmail.com>
References: <20260927201631.153126-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PIN_DATA_READY response for an unconfigured pin dereferences a NULL
output_pins_queue entry in interrupt context. Check the queue like the
ipu6 path does.

Fixes: f268203d74ff ("media: ipu6: Add ipu7 isr handler")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index 19e063b22a15..dca9c8fbc3ac 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -638,7 +638,8 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
 					   struct isys_fw_msgs, dummy);
 
 		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), isys_fw_msg);
-		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS)
+		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
+		    stream->output_pins_queue[resp->pin_id])
 			ipu6_stream_buf_ready(stream, resp->pin_id,
 					      resp->pin.addr, ts, 0);
 		else
-- 
2.55.0

