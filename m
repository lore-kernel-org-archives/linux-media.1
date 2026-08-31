Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B962A37FF71
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199293; cv=none; b=AXqyYXJIA1JqEf6Wu9Bfe/1CiNqD60/RB+CHrwM6p8LWlSAvgZApQuUJ0NRVDx3ozrdo+kSV4SvRL7k0L0csZ+8k8SD/MLf+OFdU8vJp8otWKs4rMcDC4+LvxTilbVRl6GKYsowPWriHE+zSTi+L7uhCol2onimr+VvMDU3FKZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199293; c=relaxed/simple;
	bh=tOG/XM6h09iKbopfG4HSH27a9d3EpUpHmIenSbpRbCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxYjIsN19pXDguQneRFEULZ5pnc6obYZcF4aBxu3AtQS37nWgUkPu6YCci3nS1SOaIGHV1355FFlWvDyE1DXi0YmUZ3aMAVvpM1Gw3RIg4220eGEI9Q9W/3cItrYh9gnAC9Yfw7HDmHX2kr+4ndyHGCU4bHgZ2oHdHJ3voPjNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExD4FVLQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExD4FVLQ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1766204f8f.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199290; x=1788804090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SB/CLgILdTURjzN6f7W6LHAoMmDLTtylLqF9+VZGOwk=;
        b=ExD4FVLQqYcFHp1VojDfPqruxNMaH/cHYRGMjDzAVXsWiDDTnquJhAA1wAH8At7l8P
         +gtk9zN/HbQ2nRw70x4hDL4UjXXsFENwMqNMd3JxSTJqy4kwvKJvlYX3Ig/wJGj7KfOn
         5ngjEEgKcegyqZYogz908kvlZZ69OjF+yzFXdL2VspG0UqC3CaflDkAd/WdG2LpvfoIx
         6hvq7DTFM6QBdca08ZFadUfERl5mU3HiRQZgyrbltChFGYpZgOjj8UMvJ6I68cmD/D3x
         g1RSicChU6oLaDMy9/rXDtLxjdbHKBMnY8uI4eQVwPqk/kxKrE1wyUA+ClKK83wZ2XZa
         Dg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199290; x=1788804090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SB/CLgILdTURjzN6f7W6LHAoMmDLTtylLqF9+VZGOwk=;
        b=DV/FPFXeZMhntCxqut6xKn1hNtKniLf/SNIItp5VFTMim2lfcSKH2Z/GWMOXhJDQDP
         eHZ2L+TcrstHYFv54mY54mH1BJpizB1aNmaGLANEjb1SkXBiiHxyXf8wyr6gi1C7XdBL
         +Ppuq9OCQwE5AEqFaGgcNJuuNicZ0t4xqfAt6MznEEX257lNqv6VIlAkN/XqH+1KvU31
         +rOO0BbnUMdCfv8JGunFucj9Pd1MCG3eW5XefmqsQ/k4zkwqTkHl0YP3ily2flCGkmT3
         1UQt15WfDGuah6nl4VQ6smppDGkozhNCIlgxJFLS6KvtnE+k5pdCsUGnKjejsP/hMnrl
         LRmw==
X-Gm-Message-State: AFuF++mVwU9J0PhclmgLK+Ryu6mbyTAkRB2V/NsRCmPv6P716TBgbvqD
	rAbItHa4dQ3cxiuk3IsaAmIGpbel0rOjlwPpXtiOmrMol6mbQEyC1QJTfKTN4RRpoL4=
X-Gm-Gg: AYBFou3CvVp1d7WGkZRPtTqNxX5kMihan6fiHtGSoH7pvTf4XQaS5CJMT1RYLKZqdw4
	u8YZmgLAfBZcMgKkYc6gLhGhZyFTsetCLLIxTExOYu6xor7fSlXliwBrrwN1cCbfJhHT/wSH+O5
	vpdDRiFI8bFX934GBGxBkHToqwerqfKC7iXgr/wrbjGG3spvpY0/DStMSIXiM/F4K1m5fuMrhUv
	ntZI880pUKLWGBhC/YaRlb13/tojjZBp+33mY3Wm6ZK9xus447iwrL+EczNN/l+WyHHH0LMuicd
	qcZP1h63QdE8n6N6FgUx7PVOZTtLLTPX+/wjGtFNMeUUVLYvojYspaYAMQ/5Epz4Wq3OYYjGcB2
	wETQ23fbXeF2/He7S1TqN7ELWQcSkYDjHs3bkR/nDPN0Xh3Xl85zMshFaDxqfm5g0WTxADLlQg8
	fx2ma1HeVeOFfhQUjen5fnfZZzN35jWZFCZqL9Zig/shLj09FfXCixY/AfopRlZTXwwlIiYfhU+
	PAllbsz/prda4Q7UOseLb2b+dyryeD5I81CdGWLfqc=
X-Received: by 2002:a5d:5f49:0:b0:483:ca4a:530c with SMTP id ffacd0b85a97d-483ca4a5654mr27868570f8f.18.1788199289663;
        Mon, 31 Aug 2026 11:01:29 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:29 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 12/16] media: ov2740: release group hold after gain write errors
Date: Mon, 31 Aug 2026 20:00:57 +0200
Message-ID: <20260831180101.3109854-13-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Digital-gain updates start a register group before writing the red,
green and blue gains. The current error paths return immediately when
one of those writes fails, leaving the group open and never issuing its
end and launch commands. Later control updates can then be accumulated
in an unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index f3d91c87b3d5..5f381b7972bf 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
-- 
With Best Regards,
Maurizio Casciano

