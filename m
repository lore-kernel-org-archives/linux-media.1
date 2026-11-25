Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612184;
	b=ImIJUlXp1n65RqqDnCzFaP52dg43ol8uqo61xtgZRBKZpB689mxcAg3YGpNuhru+FZKW
	 WldorwBOqKvTHGs9cQAQu/A8YQNtnaISmMtcjqScPHM2pplxMmTv//Gj2lAl8rBYGkm/X
	 NizlXcU6xUPF52Slq9fn+0s0QuyfPZAaQ/9jclqpCx14r+mFARRJ5aOW7q/x8eLi0YfXH
	 JN75jvIhtTS/pwZvNK3qI+hC0qL32q+D2P4OYbhSpgAkNsqu7Xkl+9BS6tW+v59+sorU6
	 2hDE5g2rqRq9NMCLe2rS39B4BJ0AkBTXwmxPeCh3zhT4g/c79fn/sZbnfz9JJISf6NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5hJOZPh/5l5UdrXHXCid+x1ivyDC+76FSFPhdCC5yu0=;
	b=RTeBwaic7s0eokCZvxLSF7i1BlNteybuS62Q5D1q/gsYx90o9oVhnSH4t80RGHBXPZYD
	 6Cuc1iPl7vj0iaz8LENPSzDI/jB0Mw/4jgvlv0hTFLGJSMC9r0EWGD3ficpCDX6ud+32D
	 MYnrSs3gxpPt8TRAB05uw5jc2uPVxQAOzc8h0L/zM82e/ahILMdLBG+JHPQ3r52zIz1rT
	 qPnUJ8jd2u8tZESbWs1YfPvhUXhocCI1FkWKqwH4NiIqd18SUaeBAD+X9qFuLKBdrZuRr
	 YEA/57BAYZC1CrKa70ihI3P6uSoOFnxwUvZkDP3oWIoNFWUR6z7bfYXjiSkkT7sXX4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g1nQPDDX;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09C6606A686
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09C6606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g1nQPDDX
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490d59c3edaso3920198f8f.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612182; x=1796216982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hJOZPh/5l5UdrXHXCid+x1ivyDC+76FSFPhdCC5yu0=;
        b=g1nQPDDX04Vxpww6Er2sE9ytuJNuAQ9lJtgYioCqmn0L7hVF/hiZ6BBZE8SWDabzUL
         XLZnYfLxiGTnV9Z6EXekUZkeONoYtSAncfaiHBI0f3wzugckAa/BoKdoOIPHGl65nAC1
         +x9c931pcN/lqSkd0nU4gssrSMeHHN+4W+e/Hr7dy+6WJb+5si/J2cbvE5PIbg3g9+SW
         8brArqIxDrowvKqDyK40FBHP8oJkry5mwQigkzU658nvRTUD+ZylJiwj9y3g9MV+r4+e
         rZkwtdun2HAEbBkPhtE3j6ZFJsXKGMAr1GbHL8XtR3DwueoHSxM6OVrGYZMz23Xj2RUR
         fj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612182; x=1796216982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hJOZPh/5l5UdrXHXCid+x1ivyDC+76FSFPhdCC5yu0=;
        b=sOBK5lEPUMESZ6RZsdoI2KBn6HVqns0+JF1ur/FP9eX4xILb/ARdgCbDqRnuJR6QkU
         V+rwL1ckPpdXAW7et7fC22wwug2pIuwv/JxYFSxbi7D0rCWy3ouv3yJWMB80vu3yjT98
         hvp3A/5GQlTPNyVYqUUcBkBD9+esFqRCaRYeadzp94Z5kVWKBfIIjhSe536zjXTLmt4t
         SObJL0QXFeS+TOrfI74UuVbn8uZLsx+YPeWDKb+tBX6yX+UagKKYmMcit1lQaQcxpJSY
         ZlFw3CvtTqN32fybhxxXoTG/6Q8RSY70DUUzWEvtV5uQVZwhnFwoyR+s+9AIBnf1gBPT
         SUKg==
X-Gm-Message-State: APuU4Z+iRctNlYpm2ToYJa5IEsy1iHHrPx+VoDYSC0qfHjpws4MeX+GK
	aNpwbDlzm3hOBVxHcTOU7ZrsLtgBedT043aTzJLBrc5A5II6os43a4QxzDL1EYfuzsA=
X-Gm-Gg: AZFdTZe447qud5NFndurFV66sypDj5Dc5+Bd1wO/y4o2syCZU4NhFtx/VWBtMI36xwu
	ytuBhGy9sSqnUnLqud1a57FZgqkhyrmvEzD84P/sule/UZZYj+YwAZyjH2LSGffOzLKTP1m2bk9
	1aI6UT0lPVTZcVxFSQwZ5eXKBH9sAlTQsv2zVe5NLtRo96IWLK92nyZHzFe1j/iCi74jmw5uwhK
	tSAhbRPkjOhMO8gvUc+KtgawqV1RL3wFuXSTTxc/ird5N/3uhXnVFqPA/ZM8TM0BEo7i9NI7CeZ
	xtofXymZBW8JWo0MUB7VNKpZdq93Efe4WZBda2433UiKMjhulbdgeCXSV7b2yjLGJZy/mSJG/g9
	j+NjcVaOq58etXTVf2UBW1Q7HWoeGe57GYCTxapZM+MgKC0X/spiK66U3UPj0jeTr+Bb3uYHNXq
	Q+5Ay69qxg9VirUAhVmowkVzdgFh0XyeZ0NCkzeS0uebhmAHW+38n9EQSPzDGCqIJMjm5i2mvds
	I9g5OXZE+xE9RFpmZNQrPatTcSfibEuxpU6jeQTylz7Ew7NyeefuaCMAnmCwOxnaYp7hcwyFNa8
	/o3fMG0XixEy86Yf7yLAhR8dIkJ+xpkjIigTKbemuY9ePvhevQ==
X-Received: by 2002:a05:6000:29d2:b0:4ab:240a:1728 with SMTP id ffacd0b85a97d-4ab240a175fmr29526374f8f.14.1795612181767;
        Wed, 25 Nov 2026 05:09:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:34 +0100
Subject: [PATCH 07/11] media: iris: vdec: keep the visible rectangle on
 S_FMT(CAPTURE)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-7-58b9f6b3fe86@linaro.org>
References: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
In-Reply-To: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fzj9jbO7RKAl1gqzXLKKHSc4/O1EN7DAcCHOZIrHtSI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4NlY15xlYI4xJlC/oMKF/paFhgg5A803Z7aHNZ
 omc0bGuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDQAKCRB33NvayMhJ0YdpEA
 DOBoSQpULuewnBlrfApGT/Ahko9iO59t5gI7NZg1vU8Ooq/tQM69Sy3+I8wgJms1h5V6bVsBMvBPY4
 gf575wqAF9kKVlIg7onxmVDIiRrhyuWdmzmOPVrWrg5tISrucHPJubkl7wrzTMAVtCqKpSpDblZX/R
 r/9vxOn3q3f/bLDVZB8oldWlgQPd5geOW++ByLlj6XJyxsTG30UjC/PB1Pvs/stHwJrKVgmOCpsjXQ
 pqv28k740GLsQwt4PE2m14WnvmkXFDyJY7NkZ0E+BbxyFGBDyPtXbKrp6BNEuNVAtuz1BPKPiEelHu
 9M/+NTeBNE4wS8iMMWFyLEx8aV8V1CyH7uq/dqVbP/Wz5zZM+M2p45eswUC+XKglHuR3eAsp8wCsay
 ug9et7J0st6oNpf0JW3lLuFZ7vRqAIv+ygMZcZcxsHTnFHydD3+sRkH+nHlVN6Sl3PrSoBO/RsDuiu
 Hv/ANhN4QWUQitXVIdhw1HSf26kZLCxYtk0u23jfVtNIKkGQH3wwXbUsnthn8Yfsm25RhYBONEIZ1r
 CJAS4TmL5SN+W+sa/FxipTSFiEs+Kjx9KvxPWYkTN87PAE9N5B8ORZ6vusH6mMyXH+zHvQSEGlRqdO
 Dp6vF3b+N8uaCADaywC/QCNN1nIq6/EZn0Jqt+lFg3eXi+MzRgsYIm7dC1bw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

S_FMT(CAPTURE) sets inst->crop to the requested CAPTURE size, which
try_fmt sets to the coded resolution. inst->crop is the visible rectangle
of the stream: VIDIOC_G_SELECTION returns it for the CROP and COMPOSE
targets, and gen2 sends it as input crop offsets on STREAMON(OUTPUT).

A client following the specification calls S_FMT(CAPTURE) with the
format from G_FMT after a source change. The selection targets then
return the coded resolution instead of the visible rectangle, e.g.
1920x1088 for a 1920x1080 H.264 stream, and the next STREAMON(OUTPUT),
e.g. for a seek, programs crop offsets that do not match the stream.

Only bound the visible rectangle by the new CAPTURE size.

Fixes: b530b95de22c ("media: iris: implement s_fmt, g_fmt and try_fmt ioctls")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 6369370a04a2..f7f3171ed6ad 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -327,10 +327,13 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 					   f->fmt.pix_mp.height);
 		iris_vdec_update_min_capture_bufs(inst);
 
-		inst->crop.top = 0;
-		inst->crop.left = 0;
-		inst->crop.width = f->fmt.pix_mp.width;
-		inst->crop.height = f->fmt.pix_mp.height;
+		/* inst->crop is the visible rectangle of the stream */
+		inst->crop.left = min(inst->crop.left, fmt->fmt.pix_mp.width);
+		inst->crop.top = min(inst->crop.top, fmt->fmt.pix_mp.height);
+		inst->crop.width = min(inst->crop.width,
+				       fmt->fmt.pix_mp.width - inst->crop.left);
+		inst->crop.height = min(inst->crop.height,
+					fmt->fmt.pix_mp.height - inst->crop.top);
 		break;
 	default:
 		return -EINVAL;

-- 
2.34.1

