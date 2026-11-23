Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448415;
	b=d8x6RZGVt96q2yJVS7acTiwHaOXtsI5y9BFbldKih/pgiFMU+JL+3N15AZSiKai4cSsf
	 3/u052i+7q4NmANaq8CNH0NpKs4guSNa4XPCOksO0dJG9YYDQu98n8hXCjOyM/jsPMeM9
	 DTXjqe4FPW6h8ZmkDTlP6D4kBQ3VF4ckrVA80IGxUEIYr3NyLOA43qoxnf771fpPoSY7/
	 oXgmLHHnTKYYh18Q+4P/aPd61F/lxYfeFLABNDwPLpxeUMtd77BYu7GO6eVXkdoegbmfy
	 IwzW60au2Ff3Y4lqzyVvX2eVt2+E99BtCZe3ZAjVcvEoivQbaO9V1UgRzHq9+7ZAAmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uzo3PCKNFMxYSTVKvMB2GFaEBvmy48DeYUeNPuhdPJQ=;
	b=n2Eu2nG0Xi61Dn9UPoazmpMjdQN+n4/YQH10SSsKbvDKwph/dDlvW13oCRhabjy9fP6t
	 aJzmnvncenNWU8oaX0MwL8VW0bNbf0RMF4cBnHAJmTvfwR5dyu5T44n4R0tTrCFU2Wg+C
	 KZK+U1GqmxyZyOlEn2pBUNBOh0oRZAhFLKQNXiSAaLIxNCtb5yhLNMa76RMv+c9gv9LpJ
	 PrZBcEn5SIvoog+NqtuSg68JTOdn9FUJLoBddx5fKL9NlVO9Lv8GoLG4jZzlzAIdHY4la
	 0t+FLvqCW8WLfiiGkPGgeJNt93snTVpHKSAvdgRHUPCBN9ol1bij8DJPucOxVr2F/tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aTMyQIKW;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AC160A5BCC
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46AC160A5BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aTMyQIKW
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2761c69fbso2287624c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448414; x=1796053214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzo3PCKNFMxYSTVKvMB2GFaEBvmy48DeYUeNPuhdPJQ=;
        b=aTMyQIKWhdzg8MSj+HReTp2SI+48ElaZDKRE3zJ0TNTd6WDcHJkTctU4GIdmyVzFB9
         ecgl1GdaYP8hUQxJcuc0W7FSo52Bb60FwpRZeJXa3DoQlByQwB25kop8wwJpOaO6VmOa
         gg+zHSZPK78n08i8LrLK15wSiIiAU6K3rpxfszQLBQYJ/EfGZ7aUoPD/bl5Z2zcMP+SB
         M1/m0V1c20ZQTFPmQHz50RDyIwnWnGOzva7uaf1XLHgKzkmzfzbhqwbs3DijK9HxeHLh
         CFWJrFMVoETrEPMJebvwvpbVN4//YdDpgspXfx1GDQbQnNjdZt2BIsILVNLuNt2/R4qE
         v+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448414; x=1796053214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uzo3PCKNFMxYSTVKvMB2GFaEBvmy48DeYUeNPuhdPJQ=;
        b=vwNZcWcKjtJ+XtGoCrsenKq9P0K9P+C9XHR+5jY/ZZF3edP+kBx1HV2X/rJYpXxGw/
         D5sq2GvIVOzN2pS3IAwlc4e8Zy0+hGFrbNRxjKvi8+nWQ1d8MM6tWZ2zKGxtuDUqAfbj
         8hlfqI0O16SfTQ+qqIO3ChcDo3vQ0cVdn0PAkBs+2fiwq/GFbyJDMIc0/o69+z1Fm7Jx
         ZpN+HlWdfmTd+fssuKHUBLe59B5D74UY0xdoEzvX8dpQBlHKLAMenrqle8MNfpj42yqU
         V7ZgEPIePDwZLiA7iyanQ52ZbYdaYF5fXtT7tXwVYPnrJ77Xvt6rGmU7h4v9U+MHhDaD
         tbgQ==
X-Gm-Message-State: APuU4Z9YGiU/XLdfWE7GLG6/AeTvXNgvU1W+yUTy5kqXwQide4PxYCvk
	6dc8luGs8AYRYv5PAMegDFScYcDGvWtuqSAM4r32WYGk4PMDscwQRZbz
X-Gm-Gg: AZFdTZe+dKvQlCEmGNXqikXHpWy9B8t7dWkDnbaTHFXgl9iCIuJz65PCCDxo6+sZmdf
	yoe+rYGpZKwSKL36vhv5/bAYifooUokRip3k0bBArQwHacMj9xS9Q6lJHLT0gwdE/ONI5lRX2cO
	gtjuzOCpu2Xbs87Wiot+ji5/Z5hmjaH4SBfwyH7hNc5RJbF8+biTrvgkGvlJSzSnkyXt3U7hczz
	9WHLdJl2f6TPVX53nunkyxh314Amp+FlIwwr5xl19yWGY9+caXo9HBrhNn1ADqWzkEFclHs6WfL
	3+H9CIXeHTdVjKYOrKjor9ZLePG415C+Vro9hSrm3EHqnijUywrG48guD0xwn9hAsmY06hYwUqo
	0TjQeypGYhz3dULgdQQaIH+ioF9EAWmoy/CO/HkWOcdi6wCqPdg3JhacZB7lRBGuDcyx1/nvp6N
	RWENR0J7gbrz8tOZnCcSXgKS3Puu9kIu39C9WmSi0PPsUaF5nt1ePAm6LuwR0H5R/ug70l3tEMh
	gxjBF9ohnEjyBAd4wIEx/2XyKzZn7U3uKXABmPPmTwTviOWsRAtsYbC6Gx5PMKaE6L2bmoY3r2J
	eJ73hC2fkqTNagca3CwpuZ92yvyi+nxLAHhAZg5R+3JuPLLQHsWv8L9X6DJ4ZmWbSAVR
X-Received: by 2002:a05:701b:2096:10b0:151:2e62:fe5b with SMTP id a92af1059eb24-1b5568eb642mr13573403c88.22.1795448414378;
        Mon, 23 Nov 2026 07:40:14 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:14 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/16] media: i2c: tc358746: move remove() after the PM callbacks
Date: Mon, 23 Nov 2026 22:39:26 +0700
Message-Id: <20261123153927.2547169-16-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

Move tc358746_remove() below the runtime PM callbacks so that the following
patch ("media: i2c: tc358746: power off the bridge on remove") can call
them from it without a forward declaration.

No functional change.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/tc358746.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 91d26a634023..88ff4a90eebc 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1607,24 +1607,6 @@ static int tc358746_probe(struct i2c_client *client)
 	return err;
 }
 
-static void tc358746_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct tc358746 *tc358746 = to_tc358746(sd);
-
-	v4l2_subdev_cleanup(sd);
-	v4l2_ctrl_handler_free(&tc358746->ctrl_hdl);
-	v4l2_fwnode_endpoint_free(&tc358746->csi_vep);
-	v4l2_async_nf_unregister(&tc358746->notifier);
-	v4l2_async_nf_cleanup(&tc358746->notifier);
-	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
-
-	pm_runtime_disable(sd->dev);
-	pm_runtime_set_suspended(sd->dev);
-	pm_runtime_dont_use_autosuspend(sd->dev);
-}
-
 /*
  * This function has been created just to avoid a smatch warning,
  * please do not merge it into tc358746_suspend until you have
@@ -1692,6 +1674,24 @@ static int tc358746_resume(struct device *dev)
 	return err;
 }
 
+static void tc358746_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct tc358746 *tc358746 = to_tc358746(sd);
+
+	v4l2_subdev_cleanup(sd);
+	v4l2_ctrl_handler_free(&tc358746->ctrl_hdl);
+	v4l2_fwnode_endpoint_free(&tc358746->csi_vep);
+	v4l2_async_nf_unregister(&tc358746->notifier);
+	v4l2_async_nf_cleanup(&tc358746->notifier);
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+
+	pm_runtime_disable(sd->dev);
+	pm_runtime_set_suspended(sd->dev);
+	pm_runtime_dont_use_autosuspend(sd->dev);
+}
+
 static DEFINE_RUNTIME_DEV_PM_OPS(tc358746_pm_ops, tc358746_suspend,
 				 tc358746_resume, NULL);
 
-- 
2.25.1

