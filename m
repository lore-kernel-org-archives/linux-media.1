Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793861002;
	b=jAkR4BdktPFS+5SyLRGgo5i878Oz02vqAPAj8AhrWVxJ/6OBTjazqL5kdgO1MolsPYw6
	 m7NNBu0hup1GsiQ425AlyOmeqwU0UthhIySQnv2qMk/nd3htiH/f2B/daJ1kBqf9D22uc
	 rJ2IKfjRdTticdz31D2RzOUSOovJC0WVn/8ojc5dqVQOjVqlMIJbUAQ/cOyx972XQQlmM
	 t1EZ1wU5fJaQBmM0QshKRiEc2BNtIbl5Juy4tA2Rd1+3EPtSw+/T1gUl3drhMRpTbONq7
	 7AyRFH6leGadUwE9QVr1CQA5tlgHviJBWIEaPmP6k3vtC8sQjTOOCEQSFy/tsp5d5DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HOKhZ+OmEJZ1PLckraBlLABqKVAROM53Rmk2rUoOxt0=;
	b=JZ2mdWFP/CgA7VyuUA5Y/UJDtOKEi3KeWTXU4dMwJPslj9jaoaZKlKC5nrJ66g+1Ezos
	 i61juFlS6zL5V7dBIVkzw27R2B2Y0WjnECoEZ5I6LEe5QEyEvvNpcDi9wpaQWYVEv6kzp
	 24VLKl57HBrRilanKp7o/L7DOmz1tpy8Iwd4x2vIvfiVZ7tZtGGmkcrd1aoucC3Ry9EB3
	 E/QaadbSAAOBmejY5rkCqFDsUF+/dpgeRJ1EMe5d4CUU4WOqwVrovPiSbi85oyrEE/Dym
	 5GvEk5lQILBbfpp1NoltdI69o/f95QM8lGsxMEYawZQsx0xeZo0OzBSVdsG1MSU/rBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuKVEH1x;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5CC606D831
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 06:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB5CC606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuKVEH1x
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so128898eec.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 22:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793861001; x=1794465801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HOKhZ+OmEJZ1PLckraBlLABqKVAROM53Rmk2rUoOxt0=;
        b=MuKVEH1xUqrYC1GjaCSZWWicHXAVCUiBM0uO0SW52JjbYMEzebJ4dm0N1HIEnLJ2U3
         QaJL4Js/NWHXLTqhHyqTkdoPVj+P7xA5C+aGVvan+NZ26FYSU+dH7lvWM3iuPF+9e+rU
         Tk2D2Bf4yIagI+gYv85Ac2U+LA4BqtcFBDu1pAoKRBYIe0GjHctSARx1QaCgXuPJHHbV
         YuGCistEpSmWOI+2O/wy8puh2khrR3GOL3eQuI2H6a4Ciki818ZnKt96GySPXlU8HLAi
         vjI5n0La7WeUS+jIgQbfOxypVMCoed52c7Gj8cEk9jIcksGP5wftxWQl/GyMpbPxubF2
         O/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861001; x=1794465801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HOKhZ+OmEJZ1PLckraBlLABqKVAROM53Rmk2rUoOxt0=;
        b=PXzkNd2yOQofe8tlCaATmPr+PlzZ7KQSFCDBDZMogm66HIWexYSlOqgE225kz3wuOa
         uGWPy5/z7ZMwrhNT6mtK/8EbBxj3oyKMzmjgQ27QirW9HCFEgi0z5XkpAsUM77YCr0uM
         O4u/DkocIEqL/PAXCEFSz4sVz+gscZrIQyRnKp5uwhnBz8nXKvzGMH2k7Xk//bCdBvuB
         cA1B+HlmyNKBzX3UpSZq0lvc251ziq+J/mo1PX1PraUUivv8irZ7XAwwa7zciH4GGj6M
         IS+eMpAQbsIQFym+dsYHO/p85N6O2nIZ4joLQEf7KoY/opiWSKBOrS0BM7ldDcrG2YUW
         ZNSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMDd9BapSvIVOih+rJgRExzrPoYz3UnJut3qkbxyFiVw3O3+bGsAYZxLcAsmQ2x/6U4UozVwWX8odz4Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/P9fSHE1SWRV0XzK6kwRVQowuiP/WHLIjvzbM/iNox67J0/Myz
	iqJWHkfJtRWiJjymrK9DmOx5fHfveLyvo3BUedJknJ91vX7zRvGd4GFI
X-Gm-Gg: AYBFou1gdTgZb0exVEV+WIOqoCXeSNBuTydQeJjgsIwNWkQ6yj8QP3wzkIrR4lTqNvB
	vUgFccaVdVHHXBL/mkgshQ99Yxdf3hT3zQvmSyKisyMRIADgKOrDYU6pH4zOiwrDtA9+Sv9gTKu
	rUQhVPi6V17JUvp6eQQK5azYXTAj6Xdaa0mtvUu8UwG+KVyyQBey7DXe2pdKJeQWOZQ3u3j1PnX
	ubDDy+F/97MaTs2yMmsJddPq+o985Ajt7itvqXg1ysnml3ShTkHyCuHcE1goHJ1ECkfMoyretDP
	xdot4bVFD4IKITsABcEIUkirD978m/tViiLOT0N9nbfCWRnsDDjSXmqoYYJ68nhJGd7tz59pyXr
	z00nBtWpVdN5fkiOml40iuEi0dBcQEJSljEyf8QcviXjdKmOgeLiIy5KhaDLTZa8NC2eSLJIY+r
	iiGeX3kHNqA5CdTpLnIgDwauM8Q9izq1Vcvlo9qKnsTWfFJFBMnNnAmxjUFE2oBIPiaKYc+h8Z0
	KaA9ncMiF1RYL5tx009qa9F31IcUwD26kWhmTw1oy6Blrso5eflhknOsAGSjibfGyezZMcracZ0
	Z8o0zOmej9RPxeoMAnyMuV1+I8KM5kI5ebYDTy2OL2YSbYLERzpse0kjIxCq5LZ0BFayWXvhtiE
	=
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr30063206eec.18.1793861000822;
        Wed, 04 Nov 2026 22:43:20 -0800 (PST)
Received: from kernel-dev.multipass ([49.37.221.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm19435759eec.3.2026.11.04.22.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:43:20 -0800 (PST)
From: Gobi Durairaj <gobidurairaj@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: fix block comment style in sh_css_sp.c
Date: Thu,  5 Nov 2026 12:13:12 +0530
Message-ID: <20261105064312.360626-1-gobidurairaj@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Convert block comments to the preferred kernel style with a leading
"*" on each line and the closing "*/" on its own line, as reported
by checkpatch.

Signed-off-by: Gobi Durairaj <gobidurairaj@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 2beb7168517f..bb916de3dce3 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -266,8 +266,10 @@ sh_css_sp_start_raw_copy(struct ia_css_frame *out_frame,
 	pipe->copy.raw.max_input_width = max_input_width;
 	pipe->num_stages = 1;
 	pipe->pipe_id = pipe_id;
-	/* TODO: next indicates from which queues parameters need to be
-		 sampled, needs checking/improvement */
+	/*
+	 * TODO: next indicates from which queues parameters need to be
+	 * sampled, needs checking/improvement
+	 */
 	if (pipe_conf_override == SH_CSS_PIPE_CONFIG_OVRD_NO_OVRD)
 		pipe->pipe_config =
 		    (SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << thread_id);
@@ -702,8 +704,10 @@ sh_css_sp_write_frame_pointers(const struct sh_css_binary_args *args)
 			err = set_output_frame_buffer(args->out_frame[i], i);
 	}
 
-	/* we don't pass this error back to the upper layer, so we add a assert here
-	   because we actually hit the error here but it still works by accident... */
+	/*
+	 * we don't pass this error back to the upper layer, so we add a assert here
+	 * because we actually hit the error here but it still works by accident...
+	 */
 	if (err)
 		assert(false);
 	return err;
@@ -1233,8 +1237,10 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	sh_css_sp_group.pipe[thread_id].port_id = port_id;
 	sh_css_sp_group.pipe[thread_id].dvs_frame_delay = (uint32_t)me->dvs_frame_delay;
 
-	/* TODO: next indicates from which queues parameters need to be
-		 sampled, needs checking/improvement */
+	/*
+	 * TODO: next indicates from which queues parameters need to be
+	 * sampled, needs checking/improvement
+	 */
 	if (ia_css_pipeline_uses_params(me)) {
 		sh_css_sp_group.pipe[thread_id].pipe_config =
 		SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << thread_id;
-- 
2.53.0

